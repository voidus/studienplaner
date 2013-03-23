source "https://rubygems.org"

# Server requirements
# gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Project requirements
gem 'rake'
gem 'sinatra-flash', :require => 'sinatra/flash'

# Component requirements
gem 'compass'
gem 'haml'
gem 'activerecord', :require => "active_record"
gem 'sqlite3'


# Padrino Stable Gem
gem 'padrino', '0.10.7'
gem 'padrino-assets'
gem 'padrino-flash'

gem 'json'
gem 'equalizer'

group :development do
  gem 'annotate', require: false
  gem 'autotest'
end

group :test do
  gem 'simplecov'
  gem 'rspec'
  gem 'rack-test', :require => "rack/test"
  gem 'require_all'
  gem 'factory_girl'
  gem 'coveralls', :require => false
  gem 'shoulda-matchers'
end
