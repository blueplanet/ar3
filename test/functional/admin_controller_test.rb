require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  fixtures :users

  test "index without user" do
    get :index
    assert_redirected_to :action => "login"
    assert_equal "Please Login", flash[:notice]
  end

  test "index with user" do
    get :index, {}, { :user_id => users(:dave).id }
    assert_response :success
    assert_template "index"
  end
end
