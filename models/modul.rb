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
  def self.from_latex(latex)
    ModulParser.parse latex
  end
end
