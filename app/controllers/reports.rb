class Reports < Application
  # provides :xml, :yaml, :js

  def index
    @reports = Report.all
    display @reports
  end

  def show(login, id)
    @user = User.first(:login => login)
    @report = Report.first(:user_id => @user.id, :id => id)
    raise NotFound unless @report
    display @report
  end

  def new(login)
    @user = User.first(:login => login)
    only_provides :html
    @report = Report.new
    @report.user = @user
    display @report
  end

  def edit(login, id)
    @user = User.first(:login => login)
    only_provides :html
    @report = Report.first(:user_id => @user.id, :id => id)
    raise NotFound unless @report
    display @report
  end

  def create(login, report)
    @user = User.first(:login => login)
    @report = Report.new(report)
    if @report.save
      redirect resource(@report), :message => {:notice => "Report was successfully created"}
    else
      message[:error] = "Report failed to be created"
      render :new
    end
  end

  def update(login, id, report)
    @user = User.first(:login => login)
    @report = Report.first(:user_id => @user.id, :id => id)
    raise NotFound unless @report
    if @report.update_attributes(report)
       redirect resource(@report)
    else
      display @report, :edit
    end
  end

  def destroy(login, id)
    @user = User.first(:login => login)
    @report = Report.first(:user_id => @user.id, :id => id)
    raise NotFound unless @report
    if @report.destroy
      redirect resource(:reports)
    else
      raise InternalServerError
    end
  end

end # Reports
