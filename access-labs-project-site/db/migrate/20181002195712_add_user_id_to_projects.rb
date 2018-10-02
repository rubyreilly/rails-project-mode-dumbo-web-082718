class AddUserIdToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :user_id, :integer
    add_column :projects, :image_url, :string
  end
end
