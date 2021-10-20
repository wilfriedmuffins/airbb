class AddVoyageurBooking < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :voyageur, :integer
  end
end
