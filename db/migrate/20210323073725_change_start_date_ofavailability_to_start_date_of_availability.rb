class ChangeStartDateOfavailabilityToStartDateOfAvailability < ActiveRecord::Migration[6.1]
  def change
    rename_column :logements, :start_date_ofavailability, :start_date_of_availability
  end
end
