class Item
  include DataMapper::Resource
  
  property :id, Serial
  property :description, String
  property :usage, Integer
  property :impact, Integer

  belongs_to :report
  belongs_to :metric
  
  validates_present :usage
  
  validates_with_block :report do
    if @report_id
      if Report.get(@report_id).valid?
        true
      else
        [false, "Must belong to a valid report"]
      end
    else
      [false, "Must belong to a valid report"]
    end
  end
  
  # This thing is nasty. Basically it validates that there is either a metric
  # or an impact but not both.
  validates_with_block :metric, :impact do
    if @metric_id
      if Metric.get(@metric_id).valid?
        if @impact
          [false, "Can't have both a metric and an impact"]
        else
          true
        end
      else
        [false, "Must belong to a valid metric"]
      end
    else
      unless @impact
        [false, "Need either a metric or an impact"]
      else
        true
      end
    end
  end

  # TODO: Overide #impact to utilise metric

end
