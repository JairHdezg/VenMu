# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
puts 'Creating Genres'

genres = [
  "acoustic",
  "afrobeat",
  "alt-rock",
  "alternative",
  "ambient",
  "anime",
  "black-metal",
  "bluegrass",
  "blues",
  "bossanova",
  "brazil",
  "breakbeat",
  "british",
  "cantopop",
  "chicago-house",
  "children",
  "chill",
  "classical",
  "club",
  "comedy",
  "country",
  "dance",
  "dancehall",
  "death-metal",
  "deep-house",
  "detroit-techno",
  "disco",
  "disney",
  "drum-and-bass",
  "dub",
  "dubstep",
  "edm",
  "electro",
  "electronic",
  "emo",
  "folk",
  "forro",
  "french",
  "funk",
  "garage",
  "german",
  "gospel",
  "goth",
  "grindcore",
  "groove",
  "grunge",
  "guitar",
  "happy",
  "hard-rock",
  "hardcore",
  "hardstyle",
  "heavy-metal",
  "hip-hop",
  "holidays",
  "honky-tonk",
  "house",
  "idm",
  "indian",
  "indie",
  "indie-pop",
  "industrial",
  "iranian",
  "j-dance",
  "j-idol",
  "j-pop",
  "j-rock",
  "jazz",
  "k-pop",
  "kids",
  "latin",
  "latino",
  "malay",
  "mandopop",
  "metal",
  "metal-misc",
  "metalcore",
  "minimal-techno",
  "movies",
  "mpb",
  "new-age",
  "new-release",
  "opera",
  "pagode",
  "party",
  "philippines-opm",
  "piano",
  "pop",
  "pop-film",
  "post-dubstep",
  "power-pop",
  "progressive-house",
  "psych-rock",
  "punk",
  "punk-rock",
  "r-n-b",
  "rainy-day",
  "reggae",
  "reggaeton",
  "road-trip",
  "rock",
  "rock-n-roll",
  "rockabilly",
  "romance",
  "sad",
  "salsa",
  "samba",
  "sertanejo",
  "show-tunes",
  "singer-songwriter",
  "ska",
  "sleep",
  "songwriter",
  "soul",
  "soundtracks",
  "spanish",
  "study",
  "summer",
  "swedish",
  "synth-pop",
  "tango",
  "techno",
  "trance",
  "trip-hop",
  "turkish",
  "work-out",
  "world-music"
]
genres.each do |genre|
  Genre.create(name: genre)
end

puts 'finished'

puts 'Creating 2 users'

@user1 = User.new(email: 'harry@mail.com', password: '123456')
file = URI.open('https://res.cloudinary.com/dtnzbx6ci/image/upload/v1597941567/img_1022_copy_lxyp2p.jpg')
@user1.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
@user1.save

@user2 = User.new(email: 'george@mail.com', password: '123456')
file = URI.open('https://static.standard.co.uk/s3fs-public/thumbnails/image/2020/02/26/16/george-clooney-260220-23.jpg')
@user2.photo.attach(io: file, filename: 'george.png', content_type: 'image/png')
@user2.save

puts 'Finished'

puts 'Creating 3 places'

@place1 = Place.new(name: 'Taco Bar', top_genre: 'Chill', category: 'Bar', address: 'Panama City, Panama', description: 'Cozy hangout spot with good American Music', phone_number: '55 1845 9513')
file = URI.open('https://www.dondeir.com/wp-content/uploads/2019/03/cafe-taco-bar-barra.jpg')
@place1.user = @user1
@place1.save!

@place2 = Place.new(name: 'Gin Gin', top_genre: 'Electronic', category: 'Restaurant Bar', address: 'Cuernavaca, Morelos', description: 'Kitchen Bar specializing in gin cocktails', phone_number: '55 5248 0911')
file = URI.open('https://gingin.mx/repository/imagenes/siteUbicacion/3/_MG_6749.jpg')
@place2.photos.attach(io: file, filename: 'g1.png', content_type: 'image/png')
file = URI.open('https://fastly.4sqi.net/img/general/200x200/156020961_g4F844ile81RCR0bOrOnAHYuMI10UBmLmORCglDoxqM.jpg')
@place2.photos.attach(io: file, filename: 'g2.png', content_type: 'image/png')
file = URI.open('https://i.ytimg.com/vi/wLgb5L84uiI/maxresdefault.jpg')
@place2.photos.attach(io: file, filename: 'g3.png', content_type: 'image/png')
file = URI.open('https://media-cdn.tripadvisor.com/media/photo-s/0d/c0/fa/d4/photo0jpg.jpg')
@place2.photos.attach(io: file, filename: 'g4.png', content_type: 'image/png')
@place2.user = @user1
@place2.save!

@place3 = Place.new(name: 'La Bodega', top_genre: 'Latin', category: 'Kitchen Bar', address: 'Cholula, Puebla', url: 'https://www.labodega.rest/', description: 'Mexican Restaurant with traditional music', phone_number: '55 5511 7390')
file = URI.open('https://www.labodega.rest/images/galeria/1/1.jpg')
@place3.photos.attach
@place3.user = @user2
@place3.save!

puts 'Finished'

puts 'Creating 3 reviews'

@review1 = Review.new(content: 'Great music! Alot of variety, plus good tacos', rating: 5)
@review1.place = @place2
@review1.user = @user1
@review1.save!
genre_review1 = GenresReview.new
genre_review1.review = @review1
genre_review1.genre = Genre.find_by(name: 'electronic')
genre_review1.save
@review1.genres_reviews << genre_review1
@review1.save!

@review2 = Review.new(content: 'Alot of Variety, best songs out! Awesome vibe.', rating: 5)
@review2.user = @user2
@review2.genres_reviews << genre_review1
@review2.place = @place2
@review2.save!

@review3 = Review.new(content: 'Amazing Electronic music, delicious food.', rating: 5)
@review3.user = @user2
@review3.genres_reviews << genre_review1
@review3.place = @place2
@review3.save!

puts 'Finished'

