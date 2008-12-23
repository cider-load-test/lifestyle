require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Report do

  it "must belong to a user" do
    (r = Report.new).valid?
    r.errors.on(:user).should_not be_nil
    (r = Factory(:report)).valid?
    r.errors.on(:user).should be_nil
  end

end