class RemoveZipcodeToLogement < ActiveRecord::Migration[6.1]
  def change
    remove_column(:logements, :zipcode)
  end
end
