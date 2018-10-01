class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :cohort_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :image_url
      t.string :github_link

      t.timestamps
    end
  end
end
