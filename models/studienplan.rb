class Studienplan
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  timestamps :updated_at
  has n, :moduls, through: Resource
  belongs_to :studiengang

  def credits
    moduls.map {|m| m.credits}.reduce(:+)
  end
end
