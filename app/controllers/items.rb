class Items < Application
  provides :xml, :yaml, :js
  before :ensure_authenticated
  before :find_user_and_report

  def create(item)
    @item = Item.new(item)
    @item.report = @report
    if @item.save
      redirect resource(@user, @report), :message => {:notice => "Item successfully created"}
    else
      redirect resource(@user, @report), :message => {:notice => "Item failed to be created"}
    end
  end

  def edit(id, item)
    @item = Item.first(:id => id, :report_id => @report.id)
    if @item.update_attributes(item)
      redirect resource(@user, @report, @item), :message => {:notice => "Item successfully updated"}
    else
      message[:error] = "Item failed to be updated"
    end
  end

  private
    def find_user_and_report
      @user = User.first(:login => params[:login])
      @report = Report.first(:id => params[:report_id], :user_id => @user.id)
    end

end # Users
