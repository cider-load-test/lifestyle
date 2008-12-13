class Report
  include DataMapper::Resource

  property :id, Serial
  property :day, Integer
  timestamps :at

  has 1, :user
  has n, :items
end
