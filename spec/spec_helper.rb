require 'simplecov'
SimpleCov.start do
  add_filter '/lib/compass_plugin.rb/'
  add_group 'app', '/app/'
  add_group 'lib', '/lib/'
  add_group 'models', '/models/'
  add_group 'config', '/config/'
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

require_rel 'helpers'
