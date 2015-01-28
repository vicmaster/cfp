$:.push File.expand_path("../lib", __FILE__)

require "cfp/version"

Gem::Specification.new do |s|
  s.name        = "cfp"
  s.version     = Cfp::VERSION
  s.authors     = ["David Padilla"]
  s.email       = ["david@crowdint.com"]
  s.homepage    = "https://github.com/crowdint/cfp"
  s.summary     = "Call for Papers Rails Engine used for the organization of MagmaRails"
  s.description = "Call for Papers Rails Engine used for the organization of MagmaRails"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "coffee-script"
  s.add_dependency "devise"
  s.add_dependency "haml-rails"
  s.add_dependency "rails", "~> 4.2.0"
  s.add_dependency "redcarpet", "~> 3.0.0"
  s.add_dependency "persistent_settings", "~> 1.5.0"
  s.add_dependency "sass-rails"

  s.add_development_dependency "autotest"
  s.add_development_dependency "autotest-growl"
  s.add_development_dependency "capybara"
  s.add_development_dependency "capybara-webkit"
  s.add_development_dependency "cucumber-rails"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "faker"
  s.add_development_dependency "launchy"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "spork"

  s.add_development_dependency "sqlite3"
end
