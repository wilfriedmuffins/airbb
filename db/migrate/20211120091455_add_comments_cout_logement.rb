class AddCommentsCoutLogement < ActiveRecord::Migration[6.1]
  def change
    add_column :logements, :comments_count, :integer, :default => 0
  end
end
