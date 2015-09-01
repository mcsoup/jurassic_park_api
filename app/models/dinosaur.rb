class Dinosaur < ActiveRecord::Base
  belongs_to :cage
  self.inheritance_column = :diet
 
  #scope
  scope :carnivores, -> { where(race: 'Carnivore') } 
  scope :herbivores, -> { where(race: 'Herbivore') }

  def self.races
    %w(Herbivore Carnivore)
  end

end
