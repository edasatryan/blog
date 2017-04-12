class Article < ApplicationRecord

  belongs_to :user, optional: true

  validates :title, presence: true
  validates :content, presence: true
  validates :image_name, presence: false
  validates :video, presence: false, :url => true

  has_many :comments, dependent: :destroy
end