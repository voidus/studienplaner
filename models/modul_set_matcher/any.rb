module ModulSetMatcher
  class Any
    attr_reader :children

    def initialize children
      @children = children
    end

    def matches? enum
      @children.any? do |c|
        c.matches? enum
      end
    end
  end
end
