class Reports < Application
  # provides :xml, :yaml, :js
  before :find_user

  def index
    @reports = Report.all
    display @reports
  end

  def show(id)
    @report = Report.first(:user_id => @user.id, :id => id)
    raise NotFound unless @report
    display @report
  end

  def new
    only_provides :html
    @report = Report.new
    @report.user = @user
    display @report
  end

  def edit(id)
    only_provides :html
    @report = Report.first(:user_id => @user.id, :id => id)
    raise NotFound unless @report
    display @report
  end

  def create(report)
    @report = Report.new(report)
    if @report.save
      redirect resource(@user, @report), :message => {:notice => "Report was successfully created"}
    else
      message[:error] = "Report failed to be created"
      render :new
    end
  end

  def update(id, report)
    @report = Report.first(:user_id => @user.id, :id => id)
    raise NotFound unless @report
    if @report.update_attributes(report)
       redirect resource(@user, @report)
    else
      display @report, :edit
    end
  end

  def destroy(id)
    @report = Report.first(:user_id => @user.id, :id => id)
    raise NotFound unless @report
    if @report.destroy
      redirect resource(@user, :reports)
    else
      raise InternalServerError
    end
  end

  private
    def find_user
      @user = User.first(:login => params[:login])
    end

end # Reports
