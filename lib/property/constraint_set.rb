require 'dm-core'

module DataMapper
    class Property
        class ConstraintSet < Text
            def load(value)
                p value
                JSON value
            end

            def dump(value)
                p value
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
