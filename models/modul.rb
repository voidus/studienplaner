# == Schema Information
#
# Table name: moduls
#
#  credits    :integer
#  id         :integer          not null, primary key
#  key        :string(255)
#  name       :string(255)
#  source_tex :text
#  stammmodul :boolean          default(FALSE)
#

class Modul < ActiveRecord::Base
  validates :key, presence: true
  validates :name, presence: true
  validates :credits, presence: true

  def self.from_latex(latex)
    ModulParser.parse latex
  end
end
