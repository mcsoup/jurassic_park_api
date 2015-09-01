require 'test_helper'

describe Carnivore do
  let(:trex) {Species.create label: 'Tyrannosaurus'}
  let(:carnivore1) {Carnivore.create name: 'Rex', species: trex}
  let(:carnivore2) {Carnivore.create name: 'Rexy', species: trex}
  let(:veloc) {Species.create label: 'Velociraptor'}
  let(:carnivore3) {Carnivore.create name: 'Blue', species: veloc}

  describe "valid_cage?" do
    before do
      @cage = Cage.create(max_capacity: 10, power: true)
      @carnivore = carnivore1
      @carnivore2 = carnivore2
      @carnivore3 = carnivore3
    end

    it "should be valid" do
      @cage.dinosaurs << @carnivore2
      @carnivore.cage = @cage
      assert @carnivore.valid?
    end

    describe  "should be invalid" do
      it "when cage has different species" do
        @cage.dinosaurs << @carnivore3
        @carnivore.cage = @cage
        refute @carnivore.valid?
      end
    end
  end
end
