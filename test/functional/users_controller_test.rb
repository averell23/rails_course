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
    assert_redirected_to user_path(users(:bob))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, :id => users(:amy).to_param
    end

    assert_redirected_to users_path
  end
  
  test "friend profile should have details" do
    UserSession.create(users(:amy))
    get :show, :id => users(:bob).to_param
    assert_response(:success)
    assert_template :partial => '_friend_list'
  end
  
  test "non-friend profile should not have details" do
    UserSession.create(users(:amy))
    get :show, :id => users(:eve).to_param
    assert_response(:success)
    assert_template :partial => '_friend_list', :count => 0
  end
  
  test "friend profile should have not have friend form" do
    UserSession.create(users(:amy))
    get :show, :id => users(:bob).to_param
    assert_response(:success)
    assert_template :partial => '_add_friend', :count => 0
  end
  
  test "own profile should have friend form" do
    UserSession.create(users(:amy))
    get :show, :id => users(:amy).to_param
    assert_response(:success)
    assert_template :partial => '_add_friend'
  end
end
