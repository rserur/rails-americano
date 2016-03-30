source 'https://rubygems.org'

gem 'rails', '4.2.5.2'
gem 'pg', '~> 0.15'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'jbuilder', '~> 2.0' # bundle exec rake doc:rails generates the API under doc/api.

gem 'puma' # webserver
gem 'figaro' # environment variables
gem 'bootstrap-sass', '~> 3.3.6' # bootstrap
gem 'simple_form', git: 'git://github.com/plataformatec/simple_form' # form markup

group :development, :test do
  gem 'byebug' # interactive debugging
  gem 'factory_girl_rails' # test data
  gem 'better_errors' # replacement error page
  gem 'valid_attribute' # BDD matchers
  gem 'awesome_print', require: 'ap' # pretty-print ruby objects
end

group :development do
  gem 'web-console', '~> 2.0' # <%= console %> in views
  gem 'bullet' # N+1 queries
  gem 'quiet_assets' # mute assets pipeline log messages
  gem 'letter_opener' # preview emails
  gem 'spring' # application preloading
end

group :test do
  gem 'rspec-rails' # unit testing
  gem 'capybara' # integration testing
  gem 'database_cleaner' # clean state for testing
  gem 'launchy' # cross-platform browser launching
  gem 'shoulda' # rspec matchers
  gem 'simplecov', require: false # coverage reports
end

group :production do
  gem 'rails_12factor' # heroku logging and assets
end
