require 'spec_helper'

describe GoogleKnowledgeGraph do
  before :each do
    GoogleKnowledgeGraph.api_key = nil
  end

  context 'Version' do
    it 'claims a version' do
      expect(GoogleKnowledgeGraph::VERSION).not_to be_nil
    end
  end

  context 'Configuration' do
    it 'allows setting of the api_key' do
      GoogleKnowledgeGraph.api_key = 'foo'
      expect(GoogleKnowledgeGraph.api_key).to eq 'foo'
    end
  end

  context 'Fetching knowledge entity' do
    before :each do
      GoogleKnowledgeGraph.api_key = 'foo'
    end

    describe '#self.get' do
      it 'raises error for empty api_key' do
        GoogleKnowledgeGraph.api_key = nil

        expect {
          GoogleKnowledgeGraph.get 'some_id'
        }.to raise_error 'EmptyAPIKey'
      end

      it 'raise error for id starting with `kg:`' do
        expect {
          GoogleKnowledgeGraph.get 'kg:/m/05pbsry'
        }.to raise_error 'InvalidIdStartingWithKG'
      end

      it 'returns an entity' do
        stub_request(:get, 'https://kgsearch.googleapis.com/v1/entities:search?ids=/m/05pbsry&key=foo&limit=1')
          .to_return(status: 200, body: File.read('spec/fixtures/getting_entity.json'))

        expect(GoogleKnowledgeGraph.get '/m/05pbsry').to be_a GoogleKnowledgeGraph::Entity
      end

      it 'returns nil for bad request' do
        stub_request(:get, /kgsearch.googleapis.com/)
          .to_return(status: 403)

        expect(GoogleKnowledgeGraph.get 'fakeid').to be_nil
      end
    end

    describe '#self.search' do
      it 'raises error for empty api_key' do
        GoogleKnowledgeGraph.api_key = nil

        expect {
          GoogleKnowledgeGraph.search 'some query'
        }.to raise_error 'EmptyAPIKey'
      end

      it 'returns an empty list for bad request' do
        stub_request(:get, /kgsearch.googleapis.com/)
          .to_return(status: 403)

        expect(GoogleKnowledgeGraph.search 'some query').to eq []
      end

      it 'returns an empty list if nothing is found' do
        stub_request(:get, 'https://kgsearch.googleapis.com/v1/entities:search?key=foo&query=somequerydoesnotexist')
          .to_return(status: 200, body: File.read('spec/fixtures/searching_entities_empty.json'))

        expect(GoogleKnowledgeGraph.search 'somequerydoesnotexist').to eq []
      end

      it 'returns a list of hash including entity and score' do
        stub_request(:get, 'https://kgsearch.googleapis.com/v1/entities:search?key=foo&query=community')
          .to_return(status: 200, body: File.read('spec/fixtures/searching_entities.json'))

        expect(GoogleKnowledgeGraph.search 'community').to all include(
          entity: a_kind_of(GoogleKnowledgeGraph::Entity),
          score: be_a(Numeric)
        )
      end

      it 'provides an option `types` to limit entity types' do
        stub_request(:get, /kgsearch.googleapis.com\/v1\/entities:search/)
          .to_return(status: 200, body: File.read('spec/fixtures/searching_entities.json'))

        GoogleKnowledgeGraph.search 'community', types: ['TVSeries']

        expect(
          # not the standard types[]=a&types[]=b format
          a_request(:get, 'https://kgsearch.googleapis.com/v1/entities:search?types=Thing&types=TVSeries')
            .with(query: {
              key: 'foo',
              query: 'community',
            })
        ).to have_been_made.once
      end
    end
  end
end
