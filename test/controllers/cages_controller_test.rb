require 'test_helper'

class CagesControllerTest < ActionController::TestCase
  setup do
    @cage = cages(:one)
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should create cage" do
    assert_difference('Cage.count') do
      post :create, cage: { contained: @cage.contained, max_capacity: @cage.max_capacity, power: @cage.power }, format: :json
      assert_response :success
    end
  end

  test "should show cage" do
    get :show, id: @cage, format: :json
    assert_response :success
  end

  test "should update cage" do
    patch :update, {id: @cage, cage: { contained: @cage.contained, max_capacity: @cage.max_capacity, power: @cage.power }}, format: :json
    assert_response :success
  end

  test "should destroy cage" do
    assert_difference('Cage.count', -1) do
      delete :destroy, id: @cage, format: :json
      assert_response :success
    end
  end
end
