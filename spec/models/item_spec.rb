require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Item do

  it "should have integer usage" do
    i = Item.new
    i.usage = 4
    i.usage.should == 4
    i.valid?
    i.errors.on(:usage).should be_nil
  end

  it "should have integer impact" do
    i = Item.new
    i.impact = 4
    i.impact.should == 4
    i.valid?
    i.errors.on(:impact).should be_nil
  end

end