require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe User do

  it "has reports" do
    u = Factory(:user)
    puts u.login
    u.reports << Factory(:report, :user_id => nil)
    u.reports.should_not be_empty
  end

  it "validates with a password" do
    u = Factory(:user)
    puts u.login
    u.authenticated?("test").should == true
  end

  it "validates with OpenID"

  it "must have a proper username"

end