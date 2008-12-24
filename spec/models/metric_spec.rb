require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Metric do
  it "has both usage and impact units" do
    (m = Metric.new).valid?
    m.errors.on(:impact_unit).should_not be_nil
    m.errors.on(:usage_unit).should_not be_nil
    (m = Factory.build(:metric, :impact_unit => nil)).valid?
    m.errors.on(:impact_unit).should_not be_nil
    (m = Factory.build(:metric, :usage_unit => nil)).valid?
    m.errors.on(:usage_unit).should_not be_nil
    (m = Factory.build(:metric)).valid?
    m.errors.on(:impact_unit).should be_nil
    m.errors.on(:usage_unit).should be_nil
  end

  it "has a ratio of impact/usage" do
    (m = Metric.new).valid?
    m.errors.on(:ratio).should_not be_nil
    (m = Factory.build(:metric)).valid?
    m.errors.on(:ratio).should be_nil
  end

  it "belongs to a category"

end