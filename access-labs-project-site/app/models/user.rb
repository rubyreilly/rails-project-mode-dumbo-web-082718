class User < ApplicationRecord
  belongs_to :cohort
  has_many :projects

  attr_reader :full_name


  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def password=(value)
    self.password_digest = BCrypt::Password.create(value)
  end

  def authenticate(password_string)
    BCrypt::Password.new(self.password_digest)==password_string
  end

end
