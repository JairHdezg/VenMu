class SpotifyRefreshTokenFetcher
  include Executable

  def initialize(user)
    @user = user
    @access_token = nil
  end

  def execute
    fetch_api
    get_top_songs
  end

  private

  def fetch_api
    response = RestClient.post( 'https://accounts.spotify.com/api/token',
      {
        grant_type: "authorization_code",
        code: @user.spotify_code,
        redirect_uri: "http://localhost:3000/callback",
        client_id: 'ea2e45d4ae1c4d5baca9c94a4aaa5731',
        client_secret: '9b541da2efcb4de6b00ad7d2a71c3ff3',
      }
    )
    re = JSON.parse(response)
    @access_token = re['access_token']
  end

  def get_top_songs
    @response2 = RestClient.get "https://api.spotify.com/v1/me/top/artists?time_range=short_term", {
      Authorization: "Bearer #{@access_token}"
    }
    JSON.parse(@response2)
  end
end
