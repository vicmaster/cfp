$:.push File.expand_path("../lib", __FILE__)

require "cfp/version"

Gem::Specification.new do |s|
  s.name        = "cfp"
  s.version     = Cfp::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Cfp."
  s.description = "TODO: Description of Cfp."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "devise"
  s.add_dependency "haml-rails"
  s.add_dependency "rails", "~> 3.2.9"

  s.add_development_dependency "capybara"
  s.add_development_dependency "cucumber-rails"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "faker"
  s.add_development_dependency "launchy"
  s.add_development_dependency "rspec-rails"

  s.add_development_dependency "sqlite3"
end
