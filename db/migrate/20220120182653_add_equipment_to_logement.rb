class AddEquipmentToLogement < ActiveRecord::Migration[6.1]
  def change
    add_column :logements, :equipments, :text
  end
end