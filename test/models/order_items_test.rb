require "test_helper"
require_relative "../helpers/helpers.rb"

class OrderItemsTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:duma)
    signin(@user)
    @menu_1 = create_menu()
    ActiveMenu.create(active_menu: @menu_1.id)
    add_menu_item(@menu_1.id, menu_items(:pizza))
    add_menu_item(@menu_1.id, menu_items(:burger))
  end

  test "check if order item is being added is created" do
    get "/orders/"
    assert_response :success
    assert_not_nil session[:current_order_id]
    new_order_id = session[:current_order_id]
    assert_difference("OrderItem.count") do
      post "/order_items",
           params: { order_id: new_order_id, menu_id: @menu_1.id, menu_item_id: MenuItem.last.id, menu_item_name: "Burger", menu_item_price: 35 }
    end
    assert_response :redirect
    follow_redirect!
    assert_equal "/orders", path

    assert_difference("OrderItem.count") do
      post "/order_items",
           params: { order_id: new_order_id, menu_id: @menu_1.id, menu_item_id: MenuItem.third.id, menu_item_name: "Pizza", menu_item_price: 70 }
    end
    assert_response :redirect
    follow_redirect!
    assert_equal "/orders", path

    assert Order.get_total_items_count(new_order_id) == 2
    assert Order.get_total_items_price(new_order_id) == 105
  end
end
