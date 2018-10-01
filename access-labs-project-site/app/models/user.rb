class User < ApplicationRecord
  belongs_to :cohort
  has_many :user_projects
  has_many :projects, through: :user_projects
end
