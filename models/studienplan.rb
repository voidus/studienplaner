class Studienplan < ActiveRecord::Base
  has_many :moduls
  def credits
    moduls.map {|m| m.credits}.reduce(:+)
  end
end
