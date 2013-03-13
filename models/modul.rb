require "latex_cleaner"

class Modul
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :source_tex, Text

  def self.from_latex(latex)

    source_tex = LatexCleaner.clean(latex)

    @@name_regexp ||= /\\modulename\{(?<name>(\\\}|[^\}])+)\}/
    name = @@name_regexp.match(latex)[:name]

    self.create \
      :name => name,
      :source_tex => source_tex
  end
end
