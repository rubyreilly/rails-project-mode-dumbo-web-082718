class AddDateToCohorts < ActiveRecord::Migration[5.2]
  def change
    add_column :cohorts, :start_date, :datetime
  end
end
