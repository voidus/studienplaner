module Constraints
    class StammmodulCount
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

        def to_json(*a)
            {
                'json_class' => self.class.name,
                'count' => @count
            }.to_json(*a)
        end

        def self.json_create(o)
            new o['count']
        end

        def == o
            o.instance_of? self.class and o.count == @count
        end
    end
end
