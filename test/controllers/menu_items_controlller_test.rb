require "test_helper"
require_relative "../helpers/helpers.rb"

class MenuItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # ? Register a new user
    @user = users(:deep)
    signin(@user)
    @menu_1 = create_menu()
    @item_1 = menu_items(:pizza)
  end

  test "should add a new menu item" do
    assert_difference("MenuItem.count") do
      post "/menu_items/",
           params: { menu_id: @menu_1.id, name: @item_1.name, description: @item_1.description, price: @item_1.price }
    end
    assert_response :redirect
    follow_redirect!
    assert_equal "/menus", path
  end

  test "delete a new menu item" do
    post "/menu_items/",
         params: { menu_id: Menu.last.id, name: @item_1.name, description: @item_1.description, price: @item_1.price }
    m1 = MenuItem.find_by(name: @item_1.name)
    delete "/menu_items/#{m1.id}"
    assert_not MenuItem.exists?(m1.id)
    assert_response :redirect
    follow_redirect!
    assert_equal "/menus", path
  end
end
