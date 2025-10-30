require 'cucumber/rails'
require 'capybara/rails'
require 'capybara/cucumber'
require 'rspec/rails'
require 'rspec/expectations'

ActionController::Base.allow_rescue = false

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

# helps w  session handling
module SessionHelpers
  def login_user(user_profile)
    page.driver.browser.rack_mock_session.cookie_jar["_dormdish_session"] = {
      user_profile_id: user_profile.id
    }.to_json
  end
end

World(SessionHelpers)

# for capybara thingz
Before do
  if Capybara.current_driver == :rack_test
    page.driver.browser.set_cookie('screen_size=large')
  end
  page.current_window.resize_to(1400, 900) if page.driver.respond_to?(:resize_to)
end

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

# DatabaseCleaner configuration
begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

# Configure DatabaseCleaner strategies for JavaScript-enabled features
Cucumber::Rails::Database.javascript_strategy = :truncation
