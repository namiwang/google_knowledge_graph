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

```
entity = GoogleKnowledgeGraph.get '/m/05pbsry'

entity.data
=> {
}
```

> For detail of the response, see [the reference](https://developers.google.com/knowledge-graph/reference/rest/v1)

#### shorthand methods

For your convenience, there're a few shorthand methods to `dig` into the data

```
```

### searching entities

```
```

#### options

> For detail of the options, see [the reference](https://developers.google.com/knowledge-graph/reference/rest/v1)

- limit
- types

## Development

Use `rspec` or `bundle exec rspec` to run the test suite.
