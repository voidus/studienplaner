module ModulSetMatcher
  class All
    attr_reader :children

    def initialize children
      @children = children
    end

    def matches? enum
      @children.all? do |c|
        c.matches? enum
      end
    end
  end
end
