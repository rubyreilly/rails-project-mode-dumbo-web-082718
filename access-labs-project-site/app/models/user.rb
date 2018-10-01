class User < ApplicationRecord
  belongs_to :cohort
  has_many :user_projects
  has_many :projects, through: :user_projects

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
