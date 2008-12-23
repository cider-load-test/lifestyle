require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Item do

  it "must have either impact or usage" do
    Item.new.valid?.should == false
    Factory(:item_usage).valid?.should == true
    Factory(:item_impact).valid?.should == true
  end

  it "must belong to a report" do
    (i = Item.new).valid?
    i.errors.on(:report_id).should_not be_nil
    (i = Factory(:item_usage)).valid?
    i.errors.on(:report_id).should be_nil
  end

end