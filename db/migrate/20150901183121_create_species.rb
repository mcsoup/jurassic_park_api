class CreateSpecies < ActiveRecord::Migration
  def change
    create_table :species do |t|
      t.string :label
      t.string :diet

      t.timestamps
    end
    remove_column :dinosaurs, :species, :string
    add_column :dinosaurs, :species_id, :integer
  end
end
