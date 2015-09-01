class ChangePowerFromBooleanToString < ActiveRecord::Migration
  def change
    change_column :cages, :power, :string, defualt: "DOWN"
  end
end
