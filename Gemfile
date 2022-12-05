source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.4"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem "rack-cors"

# ~ Faker [https://github.com/faker-ruby/faker#readme]
# For generating fake data
gem 'faker'

gem 'devise'
gem 'devise-jwt'
gem 'rack-cors'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]

  # For testing
  gem 'rspec-rails', '~> 6.0.0.rc1'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers', '4.0.0.rc1'
  gem 'rails-controller-testing'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

   # ~ Better Errors [https://github.com/BetterErrors/better_errors#readme]
  # For better error messages
  gem 'better_errors'
  gem 'binding_of_caller'

  # ~ DatabaseConsistency [https://github.com/djezzzl/database_consistency#readme]
  # For checking database consistency
  gem 'database_consistency', require: false

  # ~ table_print [https://github.com/arches/table_print#readme]
  # For console display of the database
  gem 'table_print'

  # ~ erb-formatter [https://github.com/nebulab/erb-formatter#readme]
  # For formatting ERB files
  gem 'erb-formatter'

  # ~ rubocop [https://github.com/rubocop/rubocop#readme]
  # ~ rubocop-faker [https://github.com/koic/rubocop-faker#readme]
  # ~ rubocop-rails [https://github.com/rubocop/rubocop-rails#readme]
  # ~ rubocop-rspec [https://github.com/rubocop/rubocop-rspec#readme]
  # For code quality
  gem 'rubocop', require: false
  gem 'rubocop-faker'
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

