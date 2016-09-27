source 'https://rubygems.org'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'pg'
gem 'puma', '~> 3.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

gem 'haml-rails'

gem 'good_migrations'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.4'
  gem 'factory_girl_rails'
  gem 'timecop', git: 'https://github.com/travisjeffery/timecop'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'brakeman'
  gem 'query_reviewer', git: 'https://github.com/nesquena/query_reviewer'
  gem 'bullet'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'spring-commands-rspec'
  gem 'pretty_backtrace', require: false
  gem 'flay'
  gem 'hirb'
  gem 'lol_dba'
  gem 'mailcatcher'
  gem 'rails-footnotes'
  gem 'rubocop'
  gem 'rubocop-rspec'
end

group :test do
  gem 'fuubar'
  gem 'simplecov', '>= 0.4.0', require: false
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'faker'
  gem 'moniker'
  gem 'shoulda'
  gem 'shoulda-matchers'
  gem 'rspec-collection_matchers'
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'poltergeist'
  gem 'launchy'
  gem 'dirty'
  gem 'site_prism'
  gem 'mutant-rspec'
  gem 'codecov', require: false
  gem 'codeclimate-test-reporter', require: nil
  gem 'codecov', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
