module GoogleKnowledgeGraph
  class Entity
    attr_reader :data

    def initialize data
      @data = data
    end

    def id
      @data['@id']
    end

    def id_without_prefix
      id.delete_prefix 'kg:'
    end

    def types
      @data['@type']
    end

    def name
      @data['name']
    end

    def url
      @data['url']
    end

    def image
      @data['image']
    end

    def image_url
      @data.dig 'image', 'contentUrl'
    end

    def description
      @data['description']
    end

    def detailed_description
      @data['detailedDescription']
    end

    def description_text
      detailed_description&.dig 'articleBody'
    end

    def description_url
      detailed_description&.dig 'url'
    end
  end
end
