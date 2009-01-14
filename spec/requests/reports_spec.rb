require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a user exists" do
  User.all.destroy!
  Report.all.destroy!
  Factory(:user)
end

given "a report exists" do
  User.all.destroy!
  Report.all.destroy!
  Factory(:report)
end

describe "resource(:reports)", :given => "a user exists" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(User.first, :reports))
    end
    
    it "responds unsuccessfully" do
      @response.should redirect_to(resource(User.first))
    end
    
  end
  
  describe "GET", :given => "a report exists" do
    before(:each) do
      @response = request(resource(User.first, :reports))
    end
    
    it "has a list of reports" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      User.all.destroy!
      Report.all.destroy!
      u = Factory(:user)
      @response = request(resource(u, :reports), :method => "POST", 
        :params => {:report => Factory.attributes_for(:report, :user_id => u.id)})
    end
    
    it "redirects to resource(@report)" do
      r = Report.first
      @response.should redirect_to(resource(r.user, r), :message => {:notice => "Report was successfully created"})
    end
    
  end
end

describe "resource(@report)" do 
  describe "a successful DELETE", :given => "a report exists" do
     before(:each) do
       @user = Report.first.user
       @response = request(resource(@user, Report.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(@user, :reports))
     end

   end
end

describe "resource(:reports, :new)" do
  before(:each) do
    @response = request(resource(User.first, :reports, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@report, :edit)", :given => "a report exists" do
  before(:each) do
    @response = request(resource(Report.first.user, Report.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@report)", :given => "a report exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Report.first.user, Report.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @report = Report.first
      @response = request(resource(@report.user, @report), :method => "PUT", 
        :params => { :report => {:id => @report.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@report.user, @report))
    end
  end
  
end

