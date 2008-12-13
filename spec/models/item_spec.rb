require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Item do

  it "should have usage" do
    i = Item.new
    i.respond_to?(:usage).should == true
    i.respond_to?(:usage=).should == true
  end

end