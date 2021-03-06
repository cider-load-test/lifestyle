require File.join( File.dirname(__FILE__), '..', "spec_helper" )

given "no users exist" do
  Users.all.destroy!
end

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

  it "must have a proper login", :given => "no users exist" do
    Factory.build(:user, :login => "i'm a test").valid?.should == true
    Factory.build(:user, :login => "test").valid?.should == true
  end

  it "validates with OpenID"

end