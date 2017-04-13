class User < ApplicationRecord
  before_save { self.username = username.downcase }

  attr_accessor :password

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 },confirmation: true
  # password_confirmation presence is true if password exists
  validates_presence_of :password_confirmation, if: :password_digest?

  has_many :articles
end