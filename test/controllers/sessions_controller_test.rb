require "test_helper"
require_relative "../helpers/helpers.rb"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # ? Register a new user
    @user = users(:deep)
    signin(users(:deep))
  end

  test "should login a registers user" do
    post "/signin/",
         params: { email: @user.email, password: @user.name }
    assert_response :redirect
    assert_equal "Succesfully Logged-In :)", flash[:success]
    follow_redirect!
    assert_not_nil session[:current_user_id]
    assert_not_nil session[:current_user_role]
    assert_equal "/", path
  end

  test "should logout a new user" do
    delete "/signout"
    assert_response :redirect
    follow_redirect!
    assert_nil session[:current_user_id]
    assert_nil session[:current_user_role]
    assert_equal "/", path
  end
end
