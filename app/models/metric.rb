class Metric
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :usage_unit, String
  property :impact_unit, String
  property :ratio, Float

  has n, :items

  validates_present :name, :usage_unit, :impact_unit, :ratio

end