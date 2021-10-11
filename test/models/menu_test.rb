require "test_helper"
require_relative "../helpers/helpers.rb"

class MenuTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:duma)
    signin(@user)
    @menu_1 = create_menu()
    ActiveMenu.create(active_menu: @menu_1.id)
  end
  test "check Menu method get_active_menu_name " do
    assert Menu.get_active_menu_name == "Lunch"
  end
end
