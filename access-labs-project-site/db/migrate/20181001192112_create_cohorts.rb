class CreateCohorts < ActiveRecord::Migration[5.2]
  def change
    create_table :cohorts do |t|
      t.integer :current_mod

      t.timestamps
    end
  end
end
