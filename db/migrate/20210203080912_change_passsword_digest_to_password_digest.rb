class ChangePassswordDigestToPasswordDigest < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :passsword_digest, :password_digest
  end
end
