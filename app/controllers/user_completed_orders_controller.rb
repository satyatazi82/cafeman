class UserCompletedOrdersController < ApplicationController
  @order_ids

  def index
    @order_ids = Order.get_users_completed_order_ids(current_user.id)
  end
end
