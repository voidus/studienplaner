module Constraints
  class StammmodulCount
    include Jsonizable.new :count

    attr_accessor :count

    def initialize count
      @count = count
    end

    def satisfied_by? studienplan
      studienplan.moduls.to_a.count {|m| m.stammmodul?} >= @count
    end

    def unfulfilled_message
      "Der Plan muss mindestens #{@count} Stammodule beinhalten"
    end

    def fulfilled_message
      "Mindestens #{@count} Stammmodule"
    end

    def == o
      o.instance_of? self.class and o.count == @count
    end
  end
end
