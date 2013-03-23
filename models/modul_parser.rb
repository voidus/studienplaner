class ModulParser
  def self.parse latex
    self.new(latex).parse
  end

  def initialize latex
    @latex = LatexCleaner.clean(latex)
  end

  def parse
    Modul.new \
      name: name,
      credits: credits,
      stammmodul: stammmodul?,
      key: key,
      source_tex: @latex
  end

  private

  def name
    @name ||= /\\modulename\{(?<name>(\\\}|[^\}])+)\}/.match(@latex)[:name]
  end

  def credits
    @credits ||= /\\modulecredits\{(?<credits>(\\\}|[^\}])+)\}/.match(@latex)[:credits]
  end

  def key
    @key ||= /\\moduleID\{(?<key>(\\\}|[^\}])+)\}/.match(@latex)[:key]
  end

  def stammmodul?
    not (/Dieses Modul ist ein Stammmodul\./ =~ (@latex) ||
      /Das Modul \\emph\{#{Regexp.escape(name)}\s*\} ?ist ein Stammmodul\./ =~ (@latex)).nil?
  end
end
