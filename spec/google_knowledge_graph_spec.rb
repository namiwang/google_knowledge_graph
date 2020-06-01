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

      pending 'returns an entity'
      pending 'returns nil for failed request'
    end

    describe '#self.search' do
      pending 'raises error for empty api_key'
      pending 'returns am empty list for failed request'
      pending 'provides an option `types` to limit entity types'
      pending 'provides an option `languages` to set languages'
      pending 'provides an option `limit` to limit the amount of results'
    end
  end

  context 'Parsing knowledge entity' do
    pending 'provides #data'
    pending 'provides #id'
    pending 'provides #name'
    pending 'provides #description'
    pending 'provides #url'
    pending 'provides #image'
  end
end
