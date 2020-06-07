require 'http'

require 'google_knowledge_graph/entity'

module GoogleKnowledgeGraph
  API_URL = 'https://kgsearch.googleapis.com/v1/entities:search'

  @api_key = nil

  class << self
    attr_accessor :api_key

    def get id
      ensure_api_key!
      id.delete_prefix! 'kg:'

      response = request(
        key: api_key,
        limit: 1,
        ids: [id]
      )

      return nil unless response.status.success?
      return nil unless data = JSON.parse(response.body).dig('itemListElement', 0, 'result')

      Entity.new(data)
    end

    def search query, types: []
      ensure_api_key!

      response = request(
        key: api_key,
        query: query,
        types: types,
      )

      return [] unless response.status.success?

      JSON.parse(response.body)['itemListElement']
        .map{ |item| {
          entity: Entity.new(item['result']),
          score: item['resultScore']
        }}
    end

    private

    def ensure_api_key!
      raise StandardError.new('EmptyAPIKey') unless api_key
    end

    def request params
      HTTP.get API_URL, params: params
    end
  end
end
