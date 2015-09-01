require 'test_helper'

describe Herbivore do
  let(:trex) {Species.create label: 'Tyrannosaurus'}
  let(:carnivore) {Carnivore.create name: 'Rex', species: trex}
  let(:trike) {Species.create label: 'Velociraptor'}
  let(:herbivore1) {Herbivore.create name: 'Sara', species: trike}
  let(:herbivore2) {Herbivore.create name: 'Cera', species: trike}

  describe "valid_cage?" do
    before do
      @cage = Cage.create(max_capacity: 10, power: 'ACTIVE')
      @carnivore = carnivore
      @herbivore1 = herbivore1
      @herbivore2 = herbivore2
    end

    it "should be valid" do
      @cage.dinosaurs << @herbivore2
      @herbivore1.cage = @cage
      assert @herbivore1.valid?
    end

    describe  "should be invalid" do
      it "when cage has a carnivore" do
        @cage.dinosaurs << @carnivore
        @herbivore1.cage = @cage
        refute @herbivore1.valid?
      end
    end
  end
end
