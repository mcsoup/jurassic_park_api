require 'test_helper'

class DinosaursControllerTest < ActionController::TestCase
  setup do
    @dinosaur = dinosaurs(:one)
  end

  test "should get index" do
    @dinosaur
    get :index, format: :json
    assert_response :success
  end

  test "should create dinosaur" do
    species = Species.create label: 'Triceratops', diet: 'Herbivore'
    assert_difference('Dinosaur.count') do
      post :create, dinosaur: { diet: 'Herbivore', name: 'Sara', species: species }, format: :json
      assert_response :success
    end
  end

  test "should show dinosaur" do
    get :show, id: @dinosaur, format: :json
    assert_response :success
  end

  test "should update dinosaur" do
    patch :update, {id: @dinosaur, dinosaur: { diet: @dinosaur.diet, name: @dinosaur.name, species: @dinosaur.species }}, format: :json
    assert_response :success
  end

  test "should destroy dinosaur" do
    assert_difference('Dinosaur.count', -1) do
      delete :destroy, id: @dinosaur, format: :json
      assert_response :success
    end
  end
end
