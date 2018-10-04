class Project < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  #validates img
end
