require 'test_helper'

describe Dinosaur do
  let(:trex) {Species.create label: 'Tyrannosaurus'}
  let(:carnivore1) {Carnivore.create name: 'Rex', species: trex}
  let(:carnivore2) {Carnivore.create name: 'Rexy', species: trex}
  let(:trike) {Species.create label: 'Triceratops'}
  let(:herbivore) {Herbivore.create name: 'Sara', species: trike}
  let(:herbivore) {Herbivore.create name: 'Sarah', species: trike}

  describe "diets" do
    it "should return the different diets" do
      assert_equal Dinosaur.diets, ["Herbivore", "Carnivore"]
    end
  end

  describe "counter_cache" do
    before do
      @cage = Cage.create(max_capacity: 10, power: true)
      @carnivore = carnivore1
    end

    describe "should increase the cage contained" do
      it "by plus one" do
        assert_difference('@cage.reload.contained') do
          @cage.dinosaurs << @carnivore   
        end
      end

      it "by minus one" do
        @cage.dinosaurs << @carnivore
        @carnivore.update cage_id: nil
        assert_equal @cage.contained, 0
      end
    end
  end

  describe "valid_cage?" do
    before do
      @cage = Cage.create(max_capacity: 10, power: true)
      @carnivore = carnivore1
    end

    it "should be valid" do
      @carnivore.cage = @cage
      assert @carnivore.valid?
    end

    describe  "should be invalid" do
      it "when cage power is down" do
        @cage.update power: false
        @carnivore.cage = @cage
        refute @carnivore.valid?
      end

      it "when cage is at max capacity" do
        @cage.update contained: 10
        @carnivore.cage = @cage
        refute @carnivore.valid?
      end
    end
  end
end
