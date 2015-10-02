require 'test_helper'

class ClientesControllerTest < ActionController::TestCase
  test "should get crear" do
    get :crear
    assert_response :success
  end

  test "should get actualizar" do
    get :actualizar
    assert_response :success
  end

  test "should get eliminar" do
    get :eliminar
    assert_response :success
  end

  test "should get mostrar" do
    get :mostrar
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get crear_reserva" do
    get :crear_reserva
    assert_response :success
  end

end
