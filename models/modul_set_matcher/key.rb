module ModulSetMatcher
  class Key
    attr_reader :key

    def initialize key
      @key = key
    end

    def matches? enum
      enum.any? {|m| m.key == @key}
    end
  end
end
