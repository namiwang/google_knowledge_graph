# google knowledge graph client

A ruby client for Google's knowledge graph to:
- getting a knowledge entity by id
- searching entities, while set limits by types, languages, and score

## Usage

### installing

```
gem install google_knowledge_graph
```
or in your Gemfile
```
gem 'google_knowledge_graph'
```
then
```
bundle install
```

### config

You'll need an API key to make a request, see the [doc](https://developers.google.com/knowledge-graph) for more information.

```
GoogleKnowledgeGraph.api_key = 'foo'
```

### getting knowledge entity by id

> google knowledge graph responses entity result with @id like `kg:/m/0dl567`,
  yet it expects id being `/m/0dl567` when querying the service

```
entity = GoogleKnowledgeGraph.get '/m/05pbsry'

# the `data` field contains the original payload
entity.data
=> {
  "url": "http://www.nbc.com/community-show/",
  "detailedDescription": {
    "url": "https://en.wikipedia.org/wiki/Community_(TV_series)",
    "license": "https://en.wikipedia.org/wiki/Wikipedia:Text_of_Creative_Commons_Attribution-ShareAlike_3.0_Unported_License",
    "articleBody": "Community is an American sitcom television series created by Dan Harmon that aired on NBC and Yahoo! Screen from September 17, 2009, to June 2, 2015. "
  },
  "@id": "kg:/m/05pbsry",
  "name": "Community",
  "@type": [
    "Thing",
    "TVSeries"
  ],
  "description": "American sitcom",
  "image": {
    "url": "https://www.wikiwand.com/en/Community_(TV_series)",
    "contentUrl": "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRvfDLB01VDeWHLm-4R68LHym6-RzrQxe2PJF9aLNDw96kL7D-2"
  }
}
```

> For detail of the response, see [the reference](https://developers.google.com/knowledge-graph/reference/rest/v1)

#### shorthand methods

For your convenience, there're a few shorthand methods to `dig` into the data

```
entity.id
=> 'kg:/m/05pbsry'

entity.id_without_prefix
=> '/m/05pbsry'

entity.id_without_prefix
=> '/m/05pbsry'

entity.types
=> ['Thing', 'TVSeries']

entity.name
=> 'Community'

entity.url
=> 'http://www.nbc.com/community-show/'

entity.image
=> {
  'url': 'https://www.wikiwand.com/en/Community_(TV_series)',
  'contentUrl': 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRvfDLB01VDeWHLm-4R68LHym6-RzrQxe2PJF9aLNDw96kL7D-2'
}

entity.image_url # data.dig 'image', 'contentUrl'
=> 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRvfDLB01VDeWHLm-4R68LHym6-RzrQxe2PJF9aLNDw96kL7D-2'

entity.description
=> 'American sitcom'

entity.detailed_description
=> {
  'license': 'https://en.wikipedia.org/wiki/Wikipedia:Text_of_Creative_Commons_Attribution-ShareAlike_3.0_Unported_License',
  'articleBody': 'Community is an American sitcom television series created by Dan Harmon that aired on NBC and Yahoo! Screen from September 17, 2009, to June 2, 2015. ',
  'url': 'https://en.wikipedia.org/wiki/Community_(TV_series)'
}

entity.description_text # data.dig 'detailedDescription', 'articleBody'
=> 'Community is an American sitcom television series created by Dan Harmon that aired on NBC and Yahoo! Screen from September 17, 2009, to June 2, 2015. '

entity.description_url # data.dig 'detailedDescription', 'url'
=> 'https://en.wikipedia.org/wiki/Community_(TV_series)'
```

### searching entities

```
GoogleKnowledgeGraph.search 'community'
=> [
  {
    entity: …,
    score: 1000,
  },
  {
    entity: …,
    score: 800,
  },
  …
]
```

#### options

```
GoogleKnowledgeGraph.search 'community', types: ['TVSeries']
=> [
  …
]
```

> Currently, `types` is the only option being supported.
> For detail of the options, see [the reference](https://developers.google.com/knowledge-graph/reference/rest/v1).

## Development

Use `rspec` or `bundle exec rspec` to run the test suite.
