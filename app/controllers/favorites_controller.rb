class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new
    authorize @favorite
    @favorite.user = current_user
    @place = Place.find(params[:place_id])
    @favorite.place = @place
    if @favorite.save
      redirect_to place_path(@place)
    else
      redirect_to place_path(@place)
    end

  end
end
