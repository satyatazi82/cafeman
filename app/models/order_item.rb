class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :menu_item

  def self.get_total_price
    total_price = 0
    all.each { |o| total_price += o.count * o.menu_item_price }
    total_price
  end

  def self.get_users_active_order(user_id)
    all.where(order_id: Order.where(user_id: user_id).where(order_status: "queue").pluck(:id)[0])
  end

  # ? Create Cart
  def self.create_from_cart(
    order_id,
    menu_item_id,
    menu_item_name,
    menu_item_price
  )
    item_existing_in_cart = OrderItem.where(order_id: order_id).find_by(menu_item_id: menu_item_id)

    # * If Does not OrderItem Exists
    # * Add a Fresh new OrderItem in the cart
    if item_existing_in_cart == nil
      OrderItem.create!(
        order_id: order_id,
        menu_item_id: menu_item_id,
        menu_item_name: menu_item_name,
        menu_item_price: menu_item_price,
        count: 1,
      )
      # * If  OrderItem Exists
      # * Update the Count of item
    else
      id = item_existing_in_cart.id
      count = item_existing_in_cart.count
      OrderItem.find(id).update!(count: count + 1)
    end
  end

  # ? Update the Count
  def self.update_order_count(
    id,
    order_menu_count
  )
    new_order_item = OrderItem.find(id)
    new_order_item.update!(count: order_menu_count)
  end

  def self.remove_from_cart(id)
    OrderItem.find(id).destroy
  end
end
