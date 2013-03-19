class Studiengang < ActiveRecord::Base
  serialize :constraints
  has_many :studienplans
    #include DataMapper::Resource

    #property :id, Serial
    #property :name, String, required: true
    #property :constraints, JsonArray, default: []
end
