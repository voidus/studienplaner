module ModulSetMatcher
  class Any
    include Jsonizer.new :children
    include Equalizer.new :children

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
