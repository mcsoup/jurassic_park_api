require 'test_helper'

class CagesControllerTest < ActionController::TestCase
  setup do
    @cage = cages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cage" do
    assert_difference('Cage.count') do
      post :create, cage: { contained: @cage.contained, max_capacity: @cage.max_capacity, power: @cage.power }
    end

    assert_redirected_to cage_path(assigns(:cage))
  end

  test "should show cage" do
    get :show, id: @cage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cage
    assert_response :success
  end

  test "should update cage" do
    patch :update, id: @cage, cage: { contained: @cage.contained, max_capacity: @cage.max_capacity, power: @cage.power }
    assert_redirected_to cage_path(assigns(:cage))
  end

  test "should destroy cage" do
    assert_difference('Cage.count', -1) do
      delete :destroy, id: @cage
    end

    assert_redirected_to cages_path
  end
end
