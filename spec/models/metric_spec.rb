require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Metric do

  before(:each) do
    User.all.destroy!
    Metric.all.destroy!
    Report.all.destroy!
    Item.all.destroy!
  end

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

  it "must have a unique name in the scope of its user" do
    (m = Metric.new).valid?
    m.errors.on(:name).should_not be_nil
    u = Factory(:user).id
    (m = Factory(:metric, :name => "test", :user_id => u)).valid?
    m.errors.on(:name).should be_nil
    (m = Factory.build(:metric, :name => "test", :user_id => u)).valid?
    m.errors.on(:name).should_not be_nil
    m.name = "tset"
    m.valid?
    m.errors.on(:name).should be_nil
  end

end