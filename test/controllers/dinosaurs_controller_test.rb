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
      post :create, dinosaur: { name: 'Sara', species: species.label }, format: :json
      assert_response :success
      assert_equal Dinosaur.last.diet, 'Herbivore' 
    end
  end

  test "should show dinosaur" do
    get :show, id: @dinosaur, format: :json
    assert_response :success
  end

  test "should update dinosaur" do
    patch :update, {id: @dinosaur, dinosaur: { diet: @dinosaur.diet, name: @dinosaur.name, species_id: @dinosaur.species_id }}, format: :json
    assert_response :success
  end

  test "should destroy dinosaur" do
    assert_difference('Dinosaur.count', -1) do
      delete :destroy, id: @dinosaur, format: :json
      assert_response :success
    end
  end
end
