class Carnivore < Dinosaur
  def valid_cage?
    super
    errors.add(:others_present, "Cage contains carnivores") unless cage.nil? or cage.dinosaurs.where.not(species_id: species_id).empty?
  end
end
