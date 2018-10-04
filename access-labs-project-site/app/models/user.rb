require 'open-uri'
require 'net/http'

class User < ApplicationRecord
  belongs_to :cohort
  has_many :projects

  validates :first_name, :last_name, :username, :password, presence: true
  validates :username, uniqueness: true
  validate :image_checker

  attr_reader :full_name, :password




  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def password=(value)
    self.password_digest = BCrypt::Password.create(value)
  end

  def authenticate(password_string)
    BCrypt::Password.new(self.password_digest)==password_string
  end

  private

  def image_checker
    begin
      url = URI.parse(self.image_url)
      Net::HTTP.start(url.host, url.port) do |http|
        return http.head(url.request_uri)['Content-Type'].start_with? 'image'
      end
    rescue
      false
    end
  end

end
