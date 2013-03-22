require 'simplecov'
SimpleCov.start do
  add_filter '/lib/compass_plugin.rb/'
  add_filter '/spec/'
  add_filter '/config/'

  add_group 'app', '/app/'
  add_group 'lib', '/lib/'
  add_group 'models', '/models/'
end

PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

def app
  ##
  # You can handle all padrino applications using instead:
  #   Padrino.application
  Studienplaner.tap { |app|  }
end

FactoryGirl.find_definitions

require_rel 'helpers'
