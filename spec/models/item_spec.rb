require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Item do

  it "must have usage and either a metric or impact" do
    Item.new.valid?.should == false
    (i = Factory.build(:item, :metric_id => nil, :impact => nil)).valid?
    i.errors.on(:metric).should_not be_nil
    i.errors.on(:impact).should_not be_nil
    (i = Factory.build(:item, :impact => 4)).valid?.should == false
    i.errors.on(:metric).should_not be_nil
    i.errors.on(:impact).should_not be_nil
    Factory.build(:item).valid?.should == true # Assumes metric and no impact
    Factory.build(:item, :metric_id => nil, :impact => 4).valid?.should == true
  end

  it "must belong to a report" do
    (i = Item.new).valid?
    i.errors.on(:report).should_not be_nil
    (i = Factory.build(:item)).valid?
    i.errors.on(:report).should be_nil
  end

end