class SessionController < ApplicationController
  skip_before_action :logged_in?
  skip_before_action :check_student
  skip_before_action :auth_user?
  skip_before_action :verify_authenticity_token
  
  
  def create
    # byebug
    github_uid = request.env["omniauth.auth"]["info"]["nickname"]
    if (user = User.find_by_github_uid(github_uid))
      session[:user_id] = user.id
      redirect_to @@name_path
    else
      flash[:alert] = "No user with GitHub name '#{github_uid}'."
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'Logged out successfully.'
    redirect_to login_path
  end

  def failure
    # byebug
    flash[:alert] = "Authentication failed, please try again. #{request}"
    flash[:alert] += params[:message] if params[:message]
    redirect_to login_path
  end

  def login
  end

end
