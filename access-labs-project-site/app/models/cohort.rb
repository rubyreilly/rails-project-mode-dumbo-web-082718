class Cohort < ApplicationRecord
  has_many :users
  has_many :projects, through: :users

  attr_reader :name

  def name
    month_day = self.start_date.strftime('%m%d')
    year = self.start_date.strftime('%Y')[2..3]
    month_day + year
  end
end
