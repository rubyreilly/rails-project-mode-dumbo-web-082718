class ChangePasswordToPasswordDigest < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :password, :password_digest
    rename_column :users, :email, :username
  end
end
