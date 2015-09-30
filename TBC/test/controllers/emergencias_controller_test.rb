require 'test_helper'

class EmergenciasControllerTest < ActionController::TestCase
  test "should get crear" do
    get :crear
    assert_response :success
  end

end
