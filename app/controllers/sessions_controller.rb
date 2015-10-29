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
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.password == (params[:session][:password])
      session[:user_id] = @user.id
        redirect_to new_post_path
      else
       flash.now[:danger] = 'Invalid email/password combination' 
    render "new"
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:fname, :lname, :email, :password)
  end
end