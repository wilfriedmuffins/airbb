class ChangeColumnLatAndLogToLatitudeAndLongitudeToLogement < ActiveRecord::Migration[6.1]
  def change
    rename_column :logements, :lat, :latitude
    rename_column :logements, :lng, :longitude
  end
end
