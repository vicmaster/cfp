ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../../spec/dummy/config/environment.rb",  __FILE__)
ENV["RAILS_ROOT"] ||= File.dirname(__FILE__) + "../../../spec/dummy"

require 'cucumber/rails'
require 'faker'
require 'capybara'
require "capybara/webkit"

Capybara.default_selector = :css
Capybara.javascript_driver = :webkit
ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Cucumber::Rails::Database.javascript_strategy = :truncation

module EngineRoutesHelper
  include Cfp::Engine.routes.url_helpers
end
World(EngineRoutesHelper)
