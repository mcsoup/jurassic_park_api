class CreateDinosaurs < ActiveRecord::Migration
  def change
    create_table :dinosaurs do |t|
      t.string :name
      t.string :species
      t.string :diet

      t.timestamps
    end

    add_index :dinosaurs, :diet
    add_index :dinosaurs, :species
  end
end
