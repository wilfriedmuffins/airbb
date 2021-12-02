class AddPriceToLogement < ActiveRecord::Migration[6.1]
  def change
    add_column :logements, :price, :integer
  end
end
