require 'spec_helper'

describe GoogleKnowledgeGraph do
  context 'Version' do
    pending 'claims a version'
  end

  context 'Configuration' do
    it 'allows setting of the api_key' do
      GoogleKnowledgeGraph.api_key = 'foo'
      expect(GoogleKnowledgeGraph.api_key).to eq 'foo'
    end
  end

  context 'Fetching knowledge entity' do
    describe '#self.get' do
      pending 'raises error for empty api_key'
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
