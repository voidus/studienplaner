# == Schema Information
#
# Table name: studiengangs
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  constraints :text
#

class Studiengang < ActiveRecord::Base
  attr_accessible :name, :constraints, :initial_moduls

  serialize :constraints
  has_many :studienplans
  has_and_belongs_to_many :initial_moduls, class_name: "Modul", join_table: "studiengangs_initial_moduls"
end
