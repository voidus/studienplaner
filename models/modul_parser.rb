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
      source_tex: @latex
  end

  private

  def name
    @name ||= /\\modulename\{(?<name>(\\\}|[^\}])+)\}/.match(@latex)[:name]
  end

  def credits
    @credits ||= /\\modulecredits\{(?<credits>(\\\}|[^\}])+)\}/.match(@latex)[:credits]
  end
end
