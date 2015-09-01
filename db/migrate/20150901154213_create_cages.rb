class CreateCages < ActiveRecord::Migration
  def change
    create_table :cages do |t|
      t.integer :max_capacity
      t.boolean :power
      t.integer :contained

      t.timestamps
    end
  end
end
