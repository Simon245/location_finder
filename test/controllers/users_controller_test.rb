require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @user = users(:simon)
    @other_user = users(:jd)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should redirect to home when not logged in" do
    get :show, id: @user
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect when logged in as wrong user" do
    log_in_as(@other_user)
    get :show, id:@user
    assert flash.empty?
    assert_redirected_to root_url
  end
end
