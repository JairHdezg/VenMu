class Place < ApplicationRecord

  geocoded_by :address

  has_many_attached :photos

  after_validation :geocode, if: :will_save_change_to_address?

  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  belongs_to :user

  def average_rating
    if (reviews.length != 0)
      reviews = self.reviews
      sum_rating = 0
      reviews.each do |review|
        sum_rating += review.rating
      end
      average = sum_rating / reviews.length
    else
      return 0
    end

  end

  def isfavorite(current_user)
    current_user.favorites.each do |favorite|
      return true if favorite.place == self
    end
    return false
  end

  def get_top_genre
    top_genres = {}
    reviews = self.reviews
    reviews.each do |review|
      review.genres.each do |genre|
        top_genres[genre.name] ? top_genres[genre.name] += 1 : top_genres[genre.name] = 1
      end
    end

    sorted_top = top_genres.sort_by { |genre, votes| votes }
    self.top_genre = sorted_top.last[0]
    self.save
  end
end
