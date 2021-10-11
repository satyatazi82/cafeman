require "test_helper"
require_relative "../helpers/helpers.rb"

class BlogFlowTest < ActionDispatch::IntegrationTest
  setup do
    # ? Register a new user
    @user = users(:deep)
    signin(users(:deep))
    @menu_1 = create_menu()
    @item_1 = menu_items(:pizza)
    ActiveMenu.create(active_menu: @menu_1.id)
  end

  test "can see the orders page" do
    get "/"
    assert_response :redirect
    follow_redirect!
    assert_equal "/orders", path
    assert_select "h1", "Cafeman"
  end

  test "should logout a new user" do
    delete "/signout"
    assert_response :redirect
    follow_redirect!
    assert_equal "/", path
  end
end
