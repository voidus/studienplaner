class Studiengang
    include DataMapper::Resource

    property :id, Serial
    property :name, String, required: true
    property :constraints, JsonArray, default: []
end
