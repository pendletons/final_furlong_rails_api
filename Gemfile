# frozen_string_literal: true

source "https://rubygems.org"

gem "rails", "~> 5.1.3"

gem "pg"
gem "puma", "~> 3.0"
# Use ActiveModel has_secure_password
gem "bcrypt", "~> 3.1.7"

gem "active_model_serializers"
gem "jwt"
gem "pundit"

gem "activerecord-clean-db-structure"
gem "good_migrations"
gem "marginalia" # logging SQL query code location
gem "scenic"

group :development, :test do
  gem "byebug", platform: :mri
  gem "dotenv-rails"
  gem "factory_girl_instruments"
  gem "factory_girl_rails"
  gem "rspec-rails", "~> 3.4"
  gem "timecop", git: "https://github.com/travisjeffery/timecop"
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "brakeman"
  gem "bullet"
  gem "flay"
  gem "hirb"
  gem "listen", "~> 3.0.5"
  gem "lol_dba"
  gem "mailcatcher"
  gem "meta_request"
  gem "pretty_backtrace", require: false
  gem "rails-footnotes"
  gem "rubocop"
  gem "rubocop-rspec"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "capybara"
  gem "capybara-screenshot"
  gem "codeclimate-test-reporter", require: nil
  gem "codecov", require: false
  gem "database_cleaner"
  gem "dirty"
  gem "email_spec"
  gem "faker"
  gem "fuubar"
  gem "launchy"
  gem "moniker"
  gem "mutant-rspec"
  gem "poltergeist"
  gem "rspec-collection_matchers"
  gem "shoulda"
  gem "shoulda-matchers"
  gem "simplecov", ">= 0.4.0", require: false
  gem "site_prism"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw]
