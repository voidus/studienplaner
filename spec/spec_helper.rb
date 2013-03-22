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

module ConstraintsInterface
  def self.included(mod)
    mod.module_eval do
      context "To fulfill the constraints interface methods it" do
        its(:class) {should respond_to(:json_create)}

        %w[satisfied_by? fulfilled_message unfulfilled_message].each do |m|
          it {should respond_to(m.to_sym)}
        end
      end
    end
  end
end

