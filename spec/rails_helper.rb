# This file is copied to spec/ when you run "rails generate rspec:install"
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "spec_helper"
require "rspec/rails"
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
ActiveRecord::Migration.maintain_test_schema!
require_relative "support/features/features_helper"

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false 
  config.include Features::FeaturesHelpers
  config.include Requests::Bitbay
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
require "support/factory_girl"
require "database_cleaner"
require "support/db_cleaner"
require "support/examples"
require "webmock/rspec"
require "support/requests"
WebMock.disable_net_connect!(allow_localhost: true)
