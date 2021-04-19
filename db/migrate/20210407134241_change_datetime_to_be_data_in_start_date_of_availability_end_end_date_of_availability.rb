class ChangeDatetimeToBeDataInStartDateOfAvailabilityEndEndDateOfAvailability < ActiveRecord::Migration[6.1]
  def change
    change_column :logements, :start_date_of_availability, :date
    change_column :logements, :end_date_of_availability, :date
  end
end
