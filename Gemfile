source 'https://rubygems.org'

gem 'rails', '~> 3.2'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
# sqlite3 for development, pg for heroku. bad idea, yes, I know..
group :development, :test do
	gem 'sqlite3'
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

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  # gem 'coffee-rails', '~> 3.2.1' # I do not. like. coffeescript!
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development, :test do
  gem 'launchy'
  gem 'steak' # Loads RSpec, Capybara, etc.
end

# Deploy with Capistrano
# gem 'capistrano'


