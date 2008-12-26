class Metric
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :usage_unit, String
  property :impact_unit, String
  property :ratio, Float

  has n, :items
  belongs_to :user

  validates_present :usage_unit, :impact_unit, :ratio

  # Validates that the name is unique but only in the scope of the metrics
  # belonging to that particular user.
  validates_with_block :name do
    if @name
      if Metric.first(:name => @name, :user_id => @user_id, :id.not => @id)
        [false, "Must have a unique name"]
      else
        true
      end
    else
      [false, "Must have a unique name"]
    end
  end

end