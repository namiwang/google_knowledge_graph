Gem::Specification.new do |s|
  s.name        = 'google_knowledge_graph'
  s.version     = '0.1.0'
  s.licenses    = ['MIT']
  s.summary     = "Ruby client for Google's Knowledge Graph"
  s.authors     = ['Nami WANG']
  s.files       = ['lib/google_knowledge_graph.rb']
  s.homepage    = 'https://github.com/ref-wiki/google_knowledge_graph'
  s.metadata    = {
    'source_code_uri' => 'https://github.com/ref-wiki/google_knowledge_graph'
  }

  s.add_development_dependency 'rspec', '~> 3.0'
end
