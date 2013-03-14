require 'dm-core'

module DataMapper
    class Property
        class ConstraintSet < String
            def load(value)
                JSON value
            end

            def dump(value)
                JSON value
            end

            def typecast(value)
                load value
            end

            #def custom?
            #    true
            #end
        end
    end
end
