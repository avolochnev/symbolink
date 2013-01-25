# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require File.expand_path('../../test/dummy/config/environment', __FILE__)
require "rspec/rails"

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each{|f| require f}

RSpec.configure do |config|
  require 'rspec/expectations'

  config.include RSpec::Matchers
  config.include Symbolink::SymbolinkHelpers

  # == Mock Framework
  config.mock_with :rspec
end