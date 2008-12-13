class Item
  include DataMapper::Resource
  
  property :id, Serial
  property :usage, Integer
  property :impact, Integer

  has 1, :report
  #has 1, :metric
end
