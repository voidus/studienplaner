module LatexCleaner
  def self.clean (latex)
    latex.gsub /[\s&&[^\n]]*\n[\s&&[^\n]]*(\n?)\s*/, "\n\\1"
  end
end
