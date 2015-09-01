class Cage < ActiveRecord::Base
  validates :max_capacity, presence: true
  validate :can_be_powered_down?
  
  has_many :dinosaurs

  delegate :herbivores, :carnivores, to: :dinosaurs

  def can_be_powered_down?
    errors.add(:cannot_be_powered_down, "Dinosaurs Present") unless dinosaurs.empty?
  end
end
