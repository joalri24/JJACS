require 'test_helper'

class EstacionesControllerTest < ActionController::TestCase
  test "should get inicio" do
    get :inicio
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get crear" do
    get :crear
    assert_response :success
  end

  test "should get actualizar" do
    get :actualizar
    assert_response :success
  end

  test "should get mostrar" do
    get :mostrar
    assert_response :success
  end

  test "should get destruir" do
    get :destruir
    assert_response :success
  end

end
