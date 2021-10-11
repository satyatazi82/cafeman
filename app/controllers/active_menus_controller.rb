class ActiveMenusController < ApplicationController

  # ? => /active_menus
  # ? GET
  def index
    render plain: "Hello from Active Menus Route"
  end

  # ? => /active_menus
  # ? PUT
  def update
    new_active_menu = params[:menu_id]
    # ? Validating Setting Menu_id
    if Menu.exists?(new_active_menu)
      ActiveMenu.first.update(active_menu: new_active_menu)
      redirect_to menus_path
    else
      flash[:error] = "Enter a Menu_id that Exists!"
      redirect_to menus_path
    end
  end
end
