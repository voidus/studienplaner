module ModulParser
  class << self
    def parse latex
      latex = LatexCleaner.clean(latex)

      Modul.new \
        name: parse_name(latex),
        credits: parse_credits(latex),
        source_tex: latex
    end

    private

    def parse_name latex
      @name_regexp ||= /\\modulename\{(?<name>(\\\}|[^\}])+)\}/
      @name_regexp.match(latex)[:name]
    end

    def parse_credits latex
      @credits_regexp ||= /\\modulecredits\{(?<credits>(\\\}|[^\}])+)\}/
      @credits_regexp.match(latex)[:credits]
    end
  end
end
