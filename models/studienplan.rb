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
  has_many :moduls
  def credits
    moduls.map {|m| m.credits}.reduce(:+)
  end
end
