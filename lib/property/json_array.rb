require 'dm-core'

module DataMapper
  class Property
    class JsonArray < Text
      def load(value)
        JSON.load(value || '[]')
      end

      def dump(constraints)
        JSON.dump constraints.to_a
      end
    end
  end
end
