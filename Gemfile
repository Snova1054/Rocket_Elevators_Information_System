source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }


ruby '2.6.6'

#Gem rails admin and the theme
gem 'rails_admin', '~> 2.0'

gem 'rails_admin_material'

gem 'blazer'
#GEM TWILIO
gem 'twilio-ruby'
# GEM FIGARO
gem 'figaro' 

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.6'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'

gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'

gem 'pg'

gem 'devise'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# call bootstrap 4
gem 'bootstrap', '~> 5.0.1'
# call zendesk api
gem 'zendesk_api'
# call google maps api
gem 'gmaps4rails'
# call ibm_watson
gem 'ibm_watson', git: 'https://github.com/watson-developer-cloud/ruby-sdk', branch: 'master'
# call dropbox_api
gem 'dropbox_api'
# To run the server
gem 'capistrano', '~> 3.10', require: false
gem 'capistrano-rails', '~> 1.4', require: false
gem 'capistrano-bundler', '>= 1.1.0'
gem 'rvm1-capistrano3', require: false
gem 'capistrano3-puma'

gem 'open-weather-ruby-client'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

#jquerry
gem 'jquery-rails'

gem 'jquery-turbolinks', '~> 2.1'

gem 'font-awesome-rails'

# bot

gem "slack-notifier" 


#sendgrid
gem 'sendgrid-ruby'
gem 'sendgrid-actionmailer'