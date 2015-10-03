require 'test_helper'

class TrayectosControllerTest < ActionController::TestCase
  test "should get crear" do
    get :crear
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get mostrar" do
    get :mostrar
    assert_response :success
  end

end
