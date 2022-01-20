source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.4'

# Use Puma as the app server
gem 'puma', '~> 5.1', '>= 5.1.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.2', '>= 5.2.1'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.2', '>= 5.2.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.10', '>= 2.10.1'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'active_model_serializers', '~> 0.10.2'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

gem 'geocoder', '~> 1.6', '>= 1.6.7'
gem 'redis', '~> 4.3', '>= 4.3.1'
gem 'figaro', '~> 1.2'
gem 'devise', '~> 4.8'
gem 'responders'
gem 'carrierwave', '~> 2.2', '>= 2.2.2'
gem 'image_processing', '~> 1.12', '>= 1.12.1'
gem 'image_magick', '~> 0.1.9'


group :development, :test do
  # Use sqlite3 as the database for Active Record

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
gem 'byebug', '~> 11.1.3' , platforms: [:mri, :mingw, :x64_mingw]

end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '~> 4.1'
  gem 'listen', '~> 3.4', '>= 3.4.1'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.1', '>= 2.1.1'
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'
  gem 'pg', '~> 1.2', '>= 1.2.3'

end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 3.34'
  gem 'selenium-webdriver', '~> 3.142', '>= 3.142.7'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers', '~> 4.4', '>= 4.4.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :production do
  gem 'pg', '~> 1.2', '>= 1.2.3'
  
  
end


