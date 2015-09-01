require 'test_helper'

describe Cage do
  let(:trex) {Species.create label: 'Tyrannosaurus'}
  let(:dinosaur) {Carnivore.create name: 'Rex', species: trex}
  let(:cage) {Cage.create max_capacity: 10, power: true}
  describe 'can_be_powered_down' do
    before do
      @cage = cage
      @dinosaur = dinosaur
    end
    
    it "should be valid if there are no dinosaurs" do
      @cage.power = 'DOWN'
      assert @cage.valid?
    end

    it "should be invalid if there are dinosaurs" do
      @cage.dinosaurs << @dinosaur
      @cage.power = false
      refute @cage.valid?
    end
  end
end
