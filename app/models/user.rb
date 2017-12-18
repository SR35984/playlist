class User < ActiveRecord::Base
  has_secure_password

  has_many :adds
  has_many :songs, through: :adds

  before_save :setCase

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  def setCase
    self.first_name.titleize
    self.last_name.titleize
    self.email.downcase!
  end
end
