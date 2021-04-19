class RemoveColumnDateAvailabilityInLogements < ActiveRecord::Migration[6.1]
  def change
    remove_column(:logements, :date_availability)
  end
end
