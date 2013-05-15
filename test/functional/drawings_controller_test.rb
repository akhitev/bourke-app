require 'test_helper'

class DrawingsControllerTest < ActionController::TestCase
  setup do
    @drawing = drawings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drawings)
  end

  test "should show drawing" do
    get :show, id: @drawing
    assert_response :success
  end

end
