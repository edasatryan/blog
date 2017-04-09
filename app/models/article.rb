class Article < ApplicationRecord

  belongs_to :user, optional: true

  validates :title, presence: true
  validates :content, presence: true
  validates :video, presence: false, :url => true

end