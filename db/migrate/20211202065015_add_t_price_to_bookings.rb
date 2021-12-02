class AddTPriceToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :t_price, :integer
  end
end
