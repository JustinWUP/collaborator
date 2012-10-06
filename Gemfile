source 'https://rubygems.org'

gem 'rails', '~> 3.2.4'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
# sqlite3 for development, pg for heroku. bad idea, yes, I know..
group :development, :test do
	gem 'sqlite3'
	
	# TODO: FactoryGirl causing trouble with rake db:migrate on fresh clone.
	gem 'factory_girl_rails'
end

gem 'thin'

# Stuff we use
gem 'devise'
gem 'cancan'
gem 'rails_autolink'
gem 'bluecloth' # For MarkDown
gem 'make_resourceful'
gem 'dynamic_form'
gem 'will_paginate', '~> 3.0.3'
gem "paperclip", "~> 3.0"
gem 'dropbox'
gem 'paperclipdropbox'
gem 'oauth'
gem 'newrelic_rpm'
gem "friendly_id", "~> 4.0.1"
gem 'auditable'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  # gem 'coffee-rails', '~> 3.2.1' # I do not. like. coffeescript!
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development do
  # gem 'ruby-debug19', :require => 'ruby-debug'
  gem "debugger"
  gem "guard-spork"
  gem "guard-rspec"
end

group :development, :test do
  gem 'launchy'
  gem 'steak' # Loads RSpec, Capybara, etc.
  gem 'watchr'
  gem 'spork-rails'
  gem 'database_cleaner'
  gem 'rb-readline'
  gem 'capybara-webkit'
  gem 'capybara-screenshot'
end

# Deploy with Capistrano
# gem 'capistrano'


