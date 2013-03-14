require "latex_cleaner"

class Modul
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :credits, Integer
  property :source_tex, Text

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
