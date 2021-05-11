class AddColumnZipcodeCityToLogements < ActiveRecord::Migration[6.1]
  def change
    add_column :logements, :city, :string
    add_column :logements, :zipcode, :integer
  end
end
