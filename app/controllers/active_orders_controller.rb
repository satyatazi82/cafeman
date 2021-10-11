class ActiveOrdersController < ApplicationController
  def index
    if current_user.is_owner?
      render "index"
    else
      redirect_to orders_path
    end
  end
end
