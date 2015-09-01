class Herbivore < Dinosaur
  def valid_cage?
    super
    errors.add(:carnivores_present, "Cage contains carnivores") unless cage.nil? or cage.carnivores.empty?
  end
end 
