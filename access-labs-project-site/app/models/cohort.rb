class Cohort < ApplicationRecord
  has_many :users
  has_many :projects, through: :users

  attr_reader :name, :increment_mod



  def name
    month_day = self.start_date.strftime('%m%d')
    year = self.start_date.strftime('%Y')[2..3]
    month_day + year
  end

  def self.increment_mod
    @cohorts = self.all
    @cohorts.each do |cohort|
      day_since_start = (Time.now - cohort.start_date)/60/60/24
      if day_since_start <21
        cohort.current_mod = 1
      elsif day_since_start <42
        cohort.current_mod =  2
      elsif day_since_start <63
        cohort.current_mod = 3
      elsif day_since_start <84
        cohort.current_mod = 4
      elsif day_since_start <105
        cohort.current_mod = 5
      else
        cohort.current_mod = 6
      end
  end
  end
end
