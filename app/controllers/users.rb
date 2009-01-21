class Users < Application
  provides :xml, :yaml, :js, :html
  before :ensure_authenticated, :only => [:edit]

  def index
    @users = User.all
    display @users
  end

  def show(login)
    @user = User.first(:login => login)
    raise NotFound unless @user
    display @user
  end

  def new
    only_provides :html
    @user = User.new
    display @user
  end

  def edit(login)
    only_provides :html
    @user = User.first(:login => login)
    raise NotFound unless @user
    display @user
  end

  def create(user)
    @user = User.new(user)
    if @user.save
      unless session.authenticated?
        session.user = @user
      end
      session[:notice] = "User was successfully created"
      redirect resource(@user)
    else
      message[:error] = "User failed to be created"
      render :new
    end
  end

  def update(login, user)
    @user = User.first(:login => login)
    raise NotFound unless @user
    if @user.update_attributes(user)
      message[:notice] = "User was successfully updated"
      redirect resource(@user)
    else
      message[:error] = "User could not be updated"
      display @user, :edit
    end
  end

  def destroy(login)
    @user = User.first(:login => login)
    raise NotFound unless @user
    if @user.destroy
      message[:notice] = "User was destroyed"
      redirect resource(:users)
    else
      raise InternalServerError
    end
  end

end # Users
