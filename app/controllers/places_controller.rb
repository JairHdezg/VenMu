class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]


  def index
    skip_policy_scope
    if params[:query]
      @query = params[:query]
      sql_query = " \
      name ILIKE :query \
      OR top_genre ILIKE :query \
      "
      @places = Place.select("places.*").where(sql_query, query: "%#{params[:query]}%")
      
      @geocodedPlaces = Place.select("places.*").where(sql_query, query: "%#{params[:query]}%").geocoded

      @markers = display_markers(@geocodedPlaces)

    else
      @places = policy_scope(Place)

      @geocodedPlaces = Place.geocoded

      @markers = display_markers(@geocodedPlaces)
    end

    @categories = [ 'Restaurant', 'Coffee shop', 'Nightclub', 'Bars', 'Brunch' ]
  end

  def show
    @place = Place.find(params[:id])
    authorize @place
    @review = Review.new
    @genres_review = GenresReview.new
    @genres = Genre.all
  end

  def new
    @place = Place.new
    authorize @place
  end

  def create
    @place = Place.new(strong_params)
    @place.user = current_user
    authorize @place
    if @place.save
      redirect_to place_path(@place)
    else
      raise
    end
  end

  def edit
    @place = Place.find(params[:id])
    authorize @place
  end

  def update
      @place = Place.find(params[:id])
      @place.update(strong_params)

      redirect_to place_path(@place)
  end

  def destroy
      @place = Place.find(params[:id])
      @place.destroy

      redirect_to places_path
  end

  private
  def strong_params
      params.require(:place).permit(:name, :top_genre, :category, :address, :url, :description, :phone_number, photos: [])
  end

  def display_markers(geocoded)
      geocoded.map do |place|
          {
            lat: place.latitude,
            lng: place.longitude,
            infoWindow: render_to_string(partial: "info_window", locals: { place: place })
          }
      end
  end
end
