class ChangeLatAndLngToFloatInLogements < ActiveRecord::Migration[6.1]
  def change
    change_column :logements, :lat, :float
    change_column :logements, :lng, :float
  end
end
