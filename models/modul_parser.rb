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
      source_tex: @latex
  end

  private

  def name
    @name ||= /\\modulename\{(?<name>(\\\}|[^\}])+)\}/.match(@latex)[:name]
  end

  def credits
    @credits ||= /\\modulecredits\{(?<credits>(\\\}|[^\}])+)\}/.match(@latex)[:credits]
  end

  def stammmodul?
    not (/Dieses Modul ist ein Stammmodul\./ =~ (@latex) ||
      /Das Modul \\emph\{#{Regexp.escape(name)}\} ist ein Stammmodul\./ =~ (@latex)).nil?
  end
end
