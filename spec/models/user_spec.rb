require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe User do

  it "has reports" do
    u = User.new
    u.reports << Report.new
    u.reports.should_not be_empty
  end

  it "validates with a password" do
    u = User.new
    u.password = "test"
    u.password_confirmation = "test"
    u.authenticated?("test").should == true
  end

end