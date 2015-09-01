class Cage < ActiveRecord::Base
  has_many :dinosaurs

  delegate :herbivores, :carnivores, to: :dinosaurs
end
