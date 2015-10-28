class SessionsController < ApplicationController
  def signup_form
    @user = User.find
  end

  def signup
    @user = User.create user_params
    session[:user_id] = @user.id

    redirect_to  login_path
  end

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to user
      else
       flash.now[:danger] = 'Invalid email/password combination' 
    render "new"
      end
  end

  def login
    @user = User.find_by email: params[:user][:email]
    if @user && @user.password == params[:user][:password]
      session[:user_id] = @user.id
      redirect_to login_path
    end
  end
  def logout
    session[:user_id] = nil
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:fname, :lname, :email, :password)
  end
end