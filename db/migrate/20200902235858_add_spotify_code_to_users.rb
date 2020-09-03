class AddSpotifyCodeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :spotify_code, :text
  end
end
