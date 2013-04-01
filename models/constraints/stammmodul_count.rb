module Constraints
  class StammmodulCount
    include Jsonizer.new :count
    include Equalizer.new :count

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
  end
end
