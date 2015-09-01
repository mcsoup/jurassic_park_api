class Dinosaur < ActiveRecord::Base
  validates :name, presence: true
  validates :species_id, presence: true
  validate :valid_cage?
  
  belongs_to :cage
  belongs_to :species

  self.inheritance_column = :diet

  before_save :update_cage, :if => ->(d) { !d.new_record? && d.cage_id_changed? }
 
  #scope
  scope :carnivores, -> { where(diet: 'Carnivore') } 
  scope :herbivores, -> { where(diet: 'Herbivore') }

  def self.diets
    %w(Herbivore Carnivore)
  end

  def valid_cage?
    errors.add(:power_down, "Cage Power is Down") unless cage.nil? or cage.power
    errors.add(:over_capacity, "Cage Max Capacity has been reached") unless cage.nil? or cage.contained < cage.max_capacity 
  end

private
  def update_cage
    Cage.decrement_counter(:contained, self.cage_id_was)
    Cage.increment_counter(:contained, self.cage_id)
  end
end


