require "test_helper"
require_relative "../helpers/helpers.rb"

class UserTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:duma)
    signin(@user)
  end
  test "should return true" do
    assert @user.is_owner?
  end
end
