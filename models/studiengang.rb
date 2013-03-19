# == Schema Information
#
# Table name: studiengangs
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  constraints :text
#

class Studiengang < ActiveRecord::Base
  attr_accessible :name, :constraints

  serialize :constraints
  has_many :studienplans
    #include DataMapper::Resource

    #property :id, Serial
    #property :name, String, required: true
    #property :constraints, JsonArray, default: []
end
