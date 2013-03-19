# == Schema Information
#
# Table name: moduls
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  source_tex :text
#  credits    :integer
#

require "latex_cleaner"

class Modul < ActiveRecord::Base
  def self.from_latex(latex)
    source_tex = LatexCleaner.clean(latex)

    @@name_regexp ||= /\\modulename\{(?<name>(\\\}|[^\}])+)\}/
    name = @@name_regexp.match(latex)[:name]

    @@credits_regexp ||= /\\modulecredits\{(?<credits>(\\\}|[^\}])+)\}/
    credits = @@credits_regexp.match(latex)[:credits]

    self.create \
      name: name,
      credits: credits,
      source_tex: source_tex
  end
end
