class AddColumnLatLogToLogements < ActiveRecord::Migration[6.1]
  def change
    add_column :logements, :lat, :integer
    add_column :logements, :lng, :integer
  end
end
