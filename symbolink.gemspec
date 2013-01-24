$:.push File.expand_path("../lib", __FILE__)

require "symbolink/version"

Gem::Specification.new do |s|
  s.name        = "symbolink"
  s.version     = Symbolink::VERSION
  s.authors     = ["Alexey Volochnev"]
  s.email       = ["alexey.volochnev@gmail.com"]
  # s.homepage    = "TODO"
  s.summary     = "Use Unicode symbols as icons in rails application"
  s.description = "Allow to register unicode symbols and displays them as symbolic icons in rails application. Provides some helpers to generate the links by symbols."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.11"

  s.add_development_dependency "sqlite3"
end