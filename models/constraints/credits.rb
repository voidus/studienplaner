module Constraints
  class Credits
    include Jsonizer.new :credits
    include Equalizer.new :credits

    attr_accessor :credits

    def initialize credits
      @credits = credits
    end

    def satisfied_by? studienplan
      studienplan.credits >= @credits
    end

    def unfulfilled_message
      "Der Plan muss mindestens #{@credits} Leistungspunkte beinhalten"
    end

    def fulfilled_message
      "Mindestens #{@credits} Leistungspunkte"
    end
  end
end
