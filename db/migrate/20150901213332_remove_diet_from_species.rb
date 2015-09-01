class RemoveDietFromSpecies < ActiveRecord::Migration
  def change
    remove_column :species, :diet
  end
end
