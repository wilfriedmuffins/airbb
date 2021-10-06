class AddImageToLogement < ActiveRecord::Migration[6.1]
  def change
    add_column :logements, :images, :string
  end
end
