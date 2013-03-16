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
            "Der Plan muss mindestens #{@credits} Leistungspunkte beinhalten"
        end

        def to_s
            "Mindestens #{@credits} Leistungspunkte"
        end

        def to_json(*a)
            {
                'json_class' => self.class.name,
                'credits' => @credits
            }.to_json(*a)
        end

        def self.json_create(o)
            new o['credits']
        end

        def == o
            o.instance_of? self.class and o.credits == @credits
        end
    end
end
