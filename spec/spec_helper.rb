require 'bundler/setup'
Bundler.setup

require 'google_knowledge_graph'

require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

# optional config
# RSpec.configure do |config|
# end
