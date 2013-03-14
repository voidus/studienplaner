require 'property/constraint_set'

class Studiengang
    include DataMapper::Resource

    property :id, Serial
    property :name, String, required: true
    property :constraints, ConstraintSet
end
