class CreateLogements < ActiveRecord::Migration[6.1]
  def change
    create_table :logements do |t|
      t.string :title
      t.string :adresse
      t.datetime :start_date_ofavailability
      t.datetime :end_date_of_availability
      t.integer :voyageur

      t.timestamps
    end
  end
end
