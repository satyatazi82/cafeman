class SessionsController < ApplicationController
  skip_before_action :ensure_logged_in

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      session[:current_user_role] = user.role
      flash[:success] = "Succesfully Logged-In :)"
      redirect_to "/"
    else
      flash[:error] = "Invalid Login Attemp Please Retry"
      redirect_to new_sessions_path
    end
  end

  # ? Destroying the Session
  def destroy
    session[:current_order_id] = nil
    session[:current_user_id] = nil
    session[:current_user_role] = nil
    @current_user = nil
    redirect_to "/"
  end
end
