# Rails Americano Template

## Description
Dead-simple Rails application template with must-have gems.

## Usage

```
$ rails new [project-name] --database=postgresql --skip-bundle --skip-gemfile 
  --skip-spring --skip-test-unit -m rails-americano/template.rb
````

## Added Gems

* General
  * [Puma](https://github.com/puma/puma) - web server
  * [Figaro](https://github.com/laserlemon/figaro) - environment variables
  * [Bootstrap for Sass](https://github.com/twbs/bootstrap-sass) - Sass-powered Bootstrap 3
  * [Simple Form](https://github.com/plataformatec/simple_form) - form markup
  * [Rails 12factor](https://github.com/heroku/rails_12factor) - Heroku logging and assets
  * [Devise](https://github.com/plataformatec/devise) (optional) - user authenitication

* Development and Testing
  * [Factory Girl](https://github.com/thoughtbot/factory_girl) - for test data
  * [Better Errors](https://github.com/charliesome/better_errors) - improved error page
  * [Valid Attribute](https://github.com/bcardarella/valid_attribute) - BDD matchers
  * [Awesome Print](https://github.com/michaeldv/awesome_print) - pretty-print ruby objects
  * [Bullet](https://github.com/flyerhzm/bullet) - kill N+1 queries
  * [Letter Opener](https://github.com/ryanb/letter_opener) - preview emails
  * [Quiet Assets](https://github.com/evrone/quiet_assets) - mute assets
  * [RSpec](https://github.com/rspec/rspec) - unit testing
  * [Capybara](https://github.com/jnicklas/capybara) - integration testing
  * [Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner) - clean database states
  * [Launchy](https://github.com/copiousfreetime/launchy) - cross-platform browser launching
  * [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers) - rspec matchers
  * [SimpleCov](https://github.com/colszowka/simplecov) - coverage reports

## Extras

 * Automates configuration of RVM ruby version and gemset
 * Sets up Bootstrap for Sass in Rails
 * Runs generators for [Devise](https://github.com/plataformatec/devise), [Simple Form](https://github.com/plataformatec/simple_form), [RSpec](https://github.com/rspec/rspec), and [Figaro](https://github.com/laserlemon/figaro)
 * Configures Rails Helper and spec directories
 * Intializes Git
 * Initializes Markdown documentation

## Dependencies

  * [Rails](http://rubyonrails.org/)
  * [Ruby Version Manager (RVM)](https://rvm.io/)
  * [PostgreSQL](http://www.postgresql.org/)
