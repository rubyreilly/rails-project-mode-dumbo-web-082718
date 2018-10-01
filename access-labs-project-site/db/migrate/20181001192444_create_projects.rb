class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.integer :mod_created
      t.string :github_link

      t.timestamps
    end
  end
end
