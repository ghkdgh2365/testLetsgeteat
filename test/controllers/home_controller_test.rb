require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get random_result" do
    get :random_result
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

end
