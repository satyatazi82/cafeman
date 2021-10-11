require "test_helper"
require_relative "../helpers/helpers.rb"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    # ? Register a new user
    @user = users(:deep)
    signin(users(:deep))
    @menu_1 = create_menu()
    add_menu_item(@menu_1.id, menu_items(:pizza))
    add_menu_item(@menu_1.id, menu_items(:burger))
    ActiveMenu.create(active_menu: @menu_1.id)
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
  end

  test "check if orders items can increase it's count" do
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

    put "/order_items/#{OrderItem.first.id}", params: { count: 4 }
    assert OrderItem.first.count == 4
    assert_response :success
  end

  test "check if orders items can be delete" do
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

    put "/order_items/#{OrderItem.first.id}", params: { count: 4 }
    assert OrderItem.first.count == 4
    assert_response :success

    delete "/order_items/#{OrderItem.first.id}"
    assert OrderItem.count == 1
    assert_response :redirect
    assert "/orders/", path
  end
end
