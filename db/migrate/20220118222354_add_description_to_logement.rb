class AddDescriptionToLogement < ActiveRecord::Migration[6.1]
  def change
    add_column :logements, :description, :string 
  end
end
