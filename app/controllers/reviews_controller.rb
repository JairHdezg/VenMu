class ReviewsController < ApplicationController
  def create
    @place = Place.find(params[:place_id])
    authorize @place
    @review = Review.new(review_params)
    @review.user = current_user
    @review.place = @place
    @review.save
    genres = params[:review][:genres]
    genres.each do |genre|
      if genre != ''
        genre_review = GenresReview.new
        genre_review.review = @review
        genre_review.genre = Genre.find(genre)
        genre_review.save
      else

      end
    end


    if @review.save
      @place.get_top_genre
      redirect_to place_path(@place)
    else
      redirect_to place_path(@place)
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def genre_review_params
    params.require(:review).permit(:genres)
  end
end
