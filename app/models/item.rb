class Item
  include DataMapper::Resource
  
  property :id, Serial
  property :usage, Integer
  property :impact, Integer

  has 1, :report
  #has 1, :metric
  
  # Validate that it belongs to a report
  # TODO: Validate that it's a valid report?
  validates_present :report_id

  # Validate that either impact or usage are present
  validates_with_block :usage, :impact do
    !!@usage || !!@impact ? true : [false, "Need either impact or usage"]
  end
end
