class User < ApplicationRecord
  has_many :articles

  validates :username, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true
end