class OrderItemsController < ApplicationController
  def create
    OrderItem.create_from_cart(
      params[:order_id],
      params[:menu_item_id],
      params[:menu_item_name],
      params[:menu_item_price]
    )
    redirect_to orders_path
  end

  def update
    OrderItem.update_order_count(
      params[:id],
      params[:count]
    )
  end

  def destroy()
    OrderItem.remove_from_cart(params[:id])
    redirect_to orders_path
  end
end
