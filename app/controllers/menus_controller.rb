class MenusController < ApplicationController
  before_action :ensure_owner

  # ? => /menus
  def index
  end

  # ? => /menus
  # ? POST
  def create
    name = params[:name]
    new_menu = Menu.new(name: name)
    new_menu.save
    if new_menu.save
      redirect_to menus_path
    else
      flash[:error] = new_menu.errors.full_messages.join(" , ")
      redirect_to menus_path
    end
  end
end
