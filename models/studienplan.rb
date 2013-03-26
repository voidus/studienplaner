# == Schema Information
#
# Table name: studienplans
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  studiengang_id :integer
#

class Studienplan < ActiveRecord::Base
  attr_accessible :name, :studiengang, :studiengang_id, :moduls

  has_and_belongs_to_many :moduls
  belongs_to :studiengang

  validates :studiengang, presence: true

  def credits
    moduls.map {|m| m.credits}.reduce(0, :+)
  end
end
