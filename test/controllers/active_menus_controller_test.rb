require "test_helper"
require_relative "../helpers/helpers.rb"

class ActiveMenusControllerTest < ActionDispatch::IntegrationTest
  setup do
    # ? Register a new user
    @user = users(:deep)
    signin(@user)
    @menu_1 = create_menu()
    @menu_2 = create_menu()
  end

  test "should update a active menus" do
    ActiveMenu.create(active_menu: @menu_1.id)
    put "/active_menus/1",
        params: { menu_id: @menu_2.id }
    assert_nil flash[:error]
    assert_response :redirect
    follow_redirect!
    assert_equal "/menus", path
  end
end
