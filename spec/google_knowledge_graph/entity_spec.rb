require 'spec_helper'

describe GoogleKnowledgeGraph::Entity do
  let(:entity_data){ JSON.parse File.read('spec/fixtures/entity_data.json') }
  let(:entity){ GoogleKnowledgeGraph::Entity.new entity_data }

  it 'init from data' do
    expect(entity).to be_a GoogleKnowledgeGraph::Entity
    expect(entity.data).to include entity_data
  end

  it 'provides shorthand methods' do
    expect(entity.id).to eq 'kg:/m/05pbsry'
    expect(entity.id_without_prefix).to eq '/m/05pbsry'
    expect(entity.types).to eq ['Thing', 'TVSeries']
    expect(entity.name).to eq 'Community'
    expect(entity.url).to eq 'http://www.nbc.com/community-show/'
    expect(entity.image).to include(
      'url' => 'https://www.wikiwand.com/en/Community_(TV_series)',
      'contentUrl' => 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRvfDLB01VDeWHLm-4R68LHym6-RzrQxe2PJF9aLNDw96kL7D-2'
    )
    expect(entity.image_url).to eq 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRvfDLB01VDeWHLm-4R68LHym6-RzrQxe2PJF9aLNDw96kL7D-2'
    expect(entity.description).to eq 'American sitcom'
    expect(entity.detailed_description).to include(
      'license' => 'https://en.wikipedia.org/wiki/Wikipedia:Text_of_Creative_Commons_Attribution-ShareAlike_3.0_Unported_License',
      'articleBody' => 'Community is an American sitcom television series created by Dan Harmon that aired on NBC and Yahoo! Screen from September 17, 2009, to June 2, 2015. ',
      'url' => 'https://en.wikipedia.org/wiki/Community_(TV_series)'
    )
    expect(entity.description_text).to eq 'Community is an American sitcom television series created by Dan Harmon that aired on NBC and Yahoo! Screen from September 17, 2009, to June 2, 2015. '
    expect(entity.description_url).to eq 'https://en.wikipedia.org/wiki/Community_(TV_series)'
  end
end
