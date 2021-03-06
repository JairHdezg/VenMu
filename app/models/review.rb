class Review < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_many :genres_reviews, dependent: :destroy
  has_many :genres, through: :genres_reviews
  validates :content, presence: true
  validates :rating, inclusion: { in: 0..5 }
end
