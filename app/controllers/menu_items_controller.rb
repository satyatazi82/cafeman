class MenuItemsController < ApplicationController
  before_action :ensure_owner

  # ? => /menu_items
  # ? => POST
  def create
    menu_id = params[:menu_id]
    name = params[:name]
    description = params[:description]
    price = params[:price]
    new_menu_item = MenuItem.new(menu_id: menu_id, name: name, description: description, price: price)
    new_menu_item.save
    if new_menu_item.save
      redirect_to menus_path
    else
      flash[:error] = new_menu_item.errors.full_messages.join(" , ")
      redirect_to menus_path
    end
  end

  # ? => DELETE
  def destroy
    menu_item_id = params[:id]
    menu_item = MenuItem.find(menu_item_id)
    menu_item.destroy
    redirect_to menus_path
  end
end
