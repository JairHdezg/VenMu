class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :connect, :callback]
  after_action :verify_authorized, except: [:index, :connect, :callback]
  require "json"
  require "rest-client"

  def index
    skip_policy_scope
    if params[:lon]
      @query = params[:query]

      if params[:address]
      sql_query = " \
          top_genre ILIKE :query \
        "
        @places = Place.select("places.*").where(sql_query, query: "%#{params[:query]}%").near(params[:address], 25)
        @geocodedPlaces = @places.geocoded
        @markers = display_markers(@geocodedPlaces)

      elsif params[:category]

        sql_query = " \
          top_genre ILIKE :query \
          AND category ILIKE :category \
        "
        @places = Place.select("places.*").where(sql_query, query: "%#{params[:query]}%", category: params[:category]).near([params[:lat], params[:lon]], 25)
        @geocodedPlaces = @places.geocoded
        @markers = display_markers(@geocodedPlaces)

      elsif params[:categories]
        sql_query = " \
          top_genre ILIKE :query \
          AND category IN (:categories) \
        "
        @places = Place.select("places.*").where(sql_query, query: "%#{params[:query]}%", categories: params[:categories]).near([params[:lat], params[:lon]], 25)
        @geocodedPlaces = @places.geocoded
        @markers = display_markers(@geocodedPlaces)

      else

        sql_query = " \
          top_genre ILIKE :query \
        "
        @places = Place.select("places.*").where(sql_query, query: "%#{params[:query]}%").near([params[:lat], params[:lon]], 25)
        @geocodedPlaces = @places.geocoded
        @markers = display_markers(@geocodedPlaces)

      end



    elsif params[:query]
      sql_query = " \
          top_genre ILIKE :query \
        "
        @places = Place.select("places.*").where(sql_query, query: "%#{params[:query]}%").near([params[:lon], params[:lat]], 2000)
        @geocodedPlaces = @places.geocoded
        @markers = display_markers(@geocodedPlaces)

    else
      @places = policy_scope(Place)
      @geocodedPlaces = Place.geocoded
      @markers = display_markers(@geocodedPlaces)
    end

    @categories = [ 'Restaurant', 'Coffee', 'Nightclub', 'Bar', 'Brunch' ]
    @user = current_user
  end

  def show
    @place = Place.find(params[:id])
    authorize @place
    @review = Review.new
    @genres_review = GenresReview.new
    @genres = Genre.all
    @user = current_user
    @favorite = Favorite.new
  end

  def new
    @place = Place.new
    authorize @place
  end

  def create
    @genres = Genre.all
    @place = Place.new(strong_params)
    @place.photos = params[:photos]
    @place.top_genre = @genres[params[:place][:top_genre].to_i - 1].name.capitalize
    @place.user = current_user
    authorize @place
    if @place.save
      redirect_to place_path(@place)
    else
      raise
    end
  end

  def connect
    skip_policy_scope
    if current_user
      if current_user.spotify_code
        redirect_to callback
      else
        redirect_to 'https://accounts.spotify.com/authorize?client_id=ea2e45d4ae1c4d5baca9c94a4aaa5731&response_type=code&redirect_uri=http://localhost:3000/callback&scope=user-read-private%20user-top-read'
      end
    else
      redirect_to new_user_session_path
    end
  end

  def callback
    skip_policy_scope
    if current_user.spotify_code
      @response = SpotifyRefreshTokenFetcher.execute(current_user)
    else
      @usercode = params[:code]
      @response = SpotifyAccessTokenFetcher.execute(current_user, @usercode)
    end
    top_genre = get_spotify_top_genre(@response['items'])
    redirect_to places_path({query: top_genre, lon: '', lat: ''})
    raise
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
      params.require(:place).permit(:name, :top_genre, :category, :address, :url, :description, :phone_number, :photos=> [])
  end

  def get_spotify_top_genre(items)
    top_genres = {}
    items.each do |item|
      item['genres'].each do |genre|
        top_genres[genre] ? top_genres[genre] += 1 : top_genres[genre] = 1
      end
    end
    all_genres = get_genres_array
    sorted_top = top_genres.sort_by { |genre, votes| votes }
    sorted_top.last[0]
    top_genres.delete_if do |key, value|
      all_genres.include?(key) == false
    end
    raise
  end

  def get_genres_array
    genre_array = []
    Genre.all do |genre|
      genre_array.push(genre.name)
    end
    genre_array
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
