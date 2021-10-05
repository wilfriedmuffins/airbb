class AddUserReferenceToLogements < ActiveRecord::Migration[6.1]
  def change
    add_reference :logements, :user, foreign_key: true
  end
end
