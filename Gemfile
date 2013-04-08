source "https://rubygems.org"

# Server requirements
# gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Project requirements
gem 'rake', '~> 10.0'
gem 'sinatra-flash', :require => 'sinatra/flash'

# Component requirements
gem 'compass', '~> 0.12.2'
gem 'haml', '~> 4.0'
gem 'activerecord', '~> 3.2', :require => "active_record"
gem 'sqlite3', '~> 1.3'


# Padrino Stable Gem
gem 'padrino', '0.10.7'
gem 'padrino-assets', '0.3.1'
gem 'padrino-flash', '0.2.0'

gem 'jsonizer', '0.1.0'
gem 'equalizer', '0.0.5'

group :development do
  gem 'annotate', require: false
end

group :test do
  gem 'simplecov'
  gem 'rspec'
  gem 'capybara'
  gem 'cucumber'
  gem 'rack-test', :require => "rack/test"
  gem 'require_all'
  gem 'factory_girl'
  gem 'coveralls', :require => false
  gem 'shoulda-matchers'
end
