class AddDateAvailabilityToLogements < ActiveRecord::Migration[6.1]
  def change
    add_column :logements, :date_availability, :daterange
  end
end
