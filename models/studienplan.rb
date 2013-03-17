class Studienplan
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  timestamps :updated_at
  has n, :moduls, through: Resource
  belongs_to :studiengang
end
