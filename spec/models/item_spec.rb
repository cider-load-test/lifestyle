require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Item do

  it "should have either impact or usage" do
    i = Item.new
    i.valid?.should == false
    i.errors.on(:impact).should_not be_nil
    i.errors.on(:usage).should_not be_nil
    i.usage = 4
    i.valid?
    i.errors.on(:impact).should be_nil
    i.errors.on(:usage).should be_nil
    i = Item.new
    i.impact = 4
    i.errors.on(:impact).should be_nil
    i.errors.on(:usage).should be_nil
  end

  it "should belong to a report" do
    r = Report.new
    r.save.should == true
    i = Item.new
    i.valid?.should == false
    i.errors.on(:report_id).should_not be_nil
    i.report_id = r.id
    i.valid?
    i.errors.on(:report_id).should be_nil
  end

end