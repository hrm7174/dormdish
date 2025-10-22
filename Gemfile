source "https://rubygems.org"

gem "rails", "~> 8.1.0"
gem "bootstrap", "~> 5.3.0"
gem "sassc-rails"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "bootsnap", require: false
gem "kamal", require: false
gem "thruster", require: false
gem "image_processing", "~> 1.2"

group :development, :test do
  # Debugging & security checks
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "bundler-audit", require: false
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false

  gem "rspec-rails", "~> 6.0"
  gem "factory_bot_rails"
  gem "faker"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "cucumber-rails", require: false
  gem "database_cleaner-active_record"
  gem "shoulda-matchers", "~> 6.5"
  gem "rails-controller-testing", "~> 1.0"
  gem "simplecov", require: false
end

group :development do
  gem "web-console"
end
