class AddBookingsCountToLogements < ActiveRecord::Migration[6.1]
  def change
    add_column :logements, :bookings_count, :integer, :default => 0, :null => false
  end
end