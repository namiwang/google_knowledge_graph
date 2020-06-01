require 'google_knowledge_graph/version'

Gem::Specification.new do |s|
  s.name        = 'google_knowledge_graph'
  s.version     = GoogleKnowledgeGraph::VERSION
  s.licenses    = ['MIT']
  s.summary     = "Ruby client for Google's Knowledge Graph"
  s.authors     = ['Nami WANG']
  s.files       = `git ls-files -z`.split("\x0")
  s.homepage    = 'https://github.com/ref-wiki/google_knowledge_graph'
  s.metadata    = {
    'source_code_uri' => 'https://github.com/ref-wiki/google_knowledge_graph'
  }

  s.add_development_dependency 'rspec', '~> 3.0'
end
