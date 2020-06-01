$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

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
  s.add_development_dependency 'webmock', '~> 3.0'
  s.add_development_dependency 'simplecov', '~> 0.18'
  s.add_development_dependency 'codecov'

  s.add_runtime_dependency 'http', '~> 4.0'
end
