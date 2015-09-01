class AddDefaultToCagePower < ActiveRecord::Migration
  def change
    change_column_default :cages, :power, false
    change_column_default :cages, :contained, 0
  end
end
