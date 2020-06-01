class GoogleKnowledgeGraph
  @api_key = nil

  class << self
    attr_accessor :api_key

    def get id
      ensure_api_key!
      raise StandardError.new('InvalidIdStartingWithKG') if id.start_with? 'kg:'
    end

    private

    def ensure_api_key!
      raise StandardError.new('EmptyAPIKey') unless api_key
    end
  end
end
