class Comment < ApplicationRecord
  belongs_to :article

  validates :name, presence: false, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: false, length: { maximum: 50 }, allow_blank: true, allow_nil: true,
            format: { with: VALID_EMAIL_REGEX }
  validates :body, presence: true, length: { maximum: 500 }
end
