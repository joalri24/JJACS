require 'test_helper'

class UsuariosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get mostrar" do
    get :mostrar
    assert_response :success
  end

  test "should get modificar" do
    get :modificar
    assert_response :success
  end

end
