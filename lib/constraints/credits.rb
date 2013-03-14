module Constraints
    class Credits
        attr_accessor :credits

        def initialize credits
            @credits = credits
        end

        def satisfied_by? studienplan
            studienplan.modules.map{|m| m.credits}.reduce(:+) >= @credits
        end

        def error_message
            "Der Plan muss mindestens #{@credits} Credit-Points beinhalten"
        end

        def == o
            o.instance_of? self.class and o.credits == @credits
        end
    end
end
