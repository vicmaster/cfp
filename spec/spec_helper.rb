require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

ENV["RAILS_ENV"] ||= 'test'

Spork.prefork do
  require File.expand_path("../dummy/config/environment", __FILE__)
  require 'rspec/rails'

  ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')

  require 'cfp'


  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    config.use_transactional_fixtures = true

    config.infer_base_class_for_anonymous_controllers = false

    config.order = "random"

    config.expect_with :rspec do |c|
      c.syntax = [:should, :expect]
    end

    config.raise_errors_for_deprecations!
  end

  class User < ActiveRecord::Base
    include Cfp::User
  end

end

Spork.each_run do
  ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"
  load './spec/dummy/db/schema.rb'
  load 'cfp.rb'
  Cfp::Config.call_for_papers_state = "closed"
end

