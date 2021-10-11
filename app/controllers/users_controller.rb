class UsersController < ApplicationController
  skip_before_action :ensure_logged_in

  def new
    render "users/new"
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    role = params[:role]
    new_user = User.new(
      name: name,
      email: email,
      password: password,
      role: role,
    )
    new_user.save
    if new_user.save
      session[:current_user_id] = new_user.id
      session[:current_user_role] = new_user.role
      flash[:success] = "Succesfully Logged-In :)"
      redirect_to "/"
    else
      flash[:error] = new_user.errors.full_messages.join(" , ")
      redirect_to new_user_path
    end
  end
end
