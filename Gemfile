source 'https://rubygems.org'

gem 'rails', '3.2.12'
gem 'pg'
gem 'haml-rails'
gem 'twitter-bootstrap-rails'
gem 'simple_form'
gem 'mechanize', :require => false

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'yui-compressor'
end

gem 'jquery-rails'

group :production do
  gem 'newrelic_rpm'
  gem 'puma'
end

group :development do
  gem 'thin'
end

group :development, :test do
  gem 'debugger'
  gem 'rack-mini-profiler'
  gem 'rspec-rails'
  gem 'spring'
end

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'launchy'
  gem 'poltergeist'
  gem 'rspec-http'
  gem 'shoulda-matchers'
end

ruby '2.0.0'
