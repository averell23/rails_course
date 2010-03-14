require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  setup :activate_authlogic
  
  
  test "should get index" do
    UserSession.create(users(:amy))
    get :index
    assert_redirected_to user_path(users(:amy))
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, :user => { :name => "Max", :email => "mad@max.com", :password => "killkillkill", :password_confirmation => "killkillkill" }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    UserSession.create(users(:amy))
    get :show, :id => users(:amy).to_param
    assert_response :success
  end

  test "should not get edit without login" do
    get :edit, :id => users(:amy).to_param
    assert_redirected_to new_user_session_path
  end
  
  test "should get edit" do
    UserSession.create(users(:amy))
    get :edit, :id => users(:amy).to_param
    assert_response :success
  end
  
  test "test should refuse edit for other users" do
    UserSession.create(users(:bob))
    get :edit, :id => users(:amy).to_param
    assert_response 401
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, :id => users(:amy).to_param
    end

    assert_redirected_to users_path
  end
end
