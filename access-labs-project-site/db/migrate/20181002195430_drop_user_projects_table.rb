class DropUserProjectsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_projects
  end
end
