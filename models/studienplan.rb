class Studienplan
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :name, String, required: true
  timestamps :updated_at
  has n, :moduls, through: Resource
end
