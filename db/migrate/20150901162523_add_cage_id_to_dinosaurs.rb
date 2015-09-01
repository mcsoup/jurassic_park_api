class AddCageIdToDinosaurs < ActiveRecord::Migration
  def change
    add_column :dinosaurs, :cage_id, :integer
    add_index :dinosaurs, :cage_id
  end
end
