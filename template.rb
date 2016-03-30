def source_paths
  [File.expand_path(File.dirname(__FILE__))]
end

def fill_license
  license_name = ask("What name should go on the License?")

  year = Time.new.year

  inject_into_file "LICENSE", after: "Copyright (c)" do
    " #{year} #{license_name}"
  end
end

copy_file "Gemfile", "Gemfile"

# RVM/Ruby Settings

puts "----RVM----"

ruby_version = ask("What version of Ruby should it use? [2.2.4]")

create_file ".ruby-version" do
  "ruby-#{ruby_version}"
end

create_file ".ruby-gemset" do
  gemset_name = ask("What would you like to call the gemset?")
  "#{gemset_name}"
end

inject_into_file "Gemfile", after: "source 'https://rubygems.org'\n" do
  "ruby '#{ruby_version}'\n"
end

# Bootstrap Setup

puts "----Bootstrap----"

remove_file "app/assets/stylesheets/application.css"
remove_file "app/assets/javascripts/application.js"

file "app/assets/stylesheets/application.scss", <<-SCSS
  @import 'bootstrap-sprockets';
  @import 'bootstrap-variables';
  @import 'bootstrap';
SCSS

file "app/assets/javascripts/application.js", <<-JS
  //= require jquery
  //= require jquery_ujs
  //= require turbolinks
  //= require bootstrap-sprockets
JS

copy_file "bootstrap-variables.scss", "app/assets/stylesheets/bootstrap-variables.scss"

# Optional Devise Installation

puts "----Devise----"

if yes?("Install Devise?")
  gem "devise"
  run "bundle install"
  generate "devise:install"
  model_name = ask("What would you like the user model to be called? [user]")
  model_name = "user" if model_name.blank?
  generate "devise", model_name
end

# Bundle

puts "----Bundling----"

run "bundle install"

# Gem Generators

puts "----Gem Generators----"

generate "simple_form:install --bootstrap"

generate "rspec:install"

run "bundle exec figaro install"

# Configure Rails Helper

puts "----Rails Helper Configuration----"

inject_into_file "spec/rails_helper.rb", after: "require 'rspec/rails'\n" do
<<-RUBY
require 'capybara/rails'
require 'valid_attribute'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
RUBY
end

Dir.mkdir("spec/features")
Dir.mkdir("spec/factories")

# Development DB Creation

puts "----Database Creation----"

rake "db:create"

# Initial Documentation

puts "----Documentation----"

copy_file "template.rb", "INSTALL.md"
remove_file "README.rdoc"
create_file "README.md", "# README"


license_type = ask("Enter \"MIT\" (simple) or \"Apache\" (limit patents) to add a license.")

if license_type.casecmp("Apache") == 0
  copy_file "APACHE-LICENSE", "LICENSE"
elsif license_type.casecmp("MIT") == 0
  copy_file "MIT-LICENSE", "LICENSE"
end

fill_license if !license_type.empty?

# Git Initialization

puts "----Git Initialization----"

after_bundle do
  git :init
  git add: "."
  git commit: %Q{ -m 'Initial commit' }
  puts "----Done! Rails Application Created----"
end