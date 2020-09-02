# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

puts "Destroying existing genres"
@genres = Genre.all
@genres.each do |genre|
  genre.destroy
end 

puts 'Destroying existing places'
@places = Place.all
@places.each do |place|
  place.photo.purge if place.photo.attached?
  place.destroy
end

puts 'Destroying existing users'
@users = User.all
@users.each do |user|
  user.photo.purge if user.photo.attached?
  user.destroy
end

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

puts 'Creating 3 users'

@user1 = User.new(email: 'harry@mail.com', password: '123456')
file = URI.open('https://res.cloudinary.com/dtnzbx6ci/image/upload/v1597941567/img_1022_copy_lxyp2p.jpg')
@user1.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
@user1.save!

@user2 = User.new(email: 'george@mail.com', password: '123456')
file = URI.open('https://static.standard.co.uk/s3fs-public/thumbnails/image/2020/02/26/16/george-clooney-260220-23.jpg')
@user2.photo.attach(io: file, filename: 'george.png', content_type: 'image/png')
@user2.save!

@user3 = User.new(email: 'triblo@mail.com', password: '123456')
file = URI.open('https://goodofgoshen.com/wp-content/uploads/2019/06/GoG19_profile-Tricia-Blosser.jpg')
@user3.photo.attach(io: file, filename: 'triblo.png', content_type: 'image/png')
@user3.save!

puts 'Finished'

puts 'Creating 4 places'
@place1 = Place.new(name: 'Taqueria San Marcos', top_genre: 'reggaeton', category: 'Nightclub', address: '113 S. Main St., Goshen, IN', description:"You'll love the reggaeton and dance music here! Great patio, tacos, as well!", phone_number: '55 1845 9513')
file = URI.open('https://www.dondeir.com/wp-content/uploads/2019/03/cafe-taco-bar-barra.jpg')
@place1.photos.attach(io: file, filename: 'taco-bar.jpg', content_type: 'image/png')
@place1.user = @user1
@place1.save!

@place2 = Place.new(name: 'Gin Gin', top_genre: 'dance', category: 'Bar', address: 'Cuernavaca, Morelos', description: 'Great dance music and reggaeton! Kitchen Bar specializes in gin cocktails', phone_number: '55 5248 0911')
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

@place3 = Place.new(name: 'La Bodega', top_genre: 'latin', category: 'Restaurant', address: 'Cholula, Puebla', url: 'https://www.labodega.rest/', description: 'Mexican Restaurant with traditional music', phone_number: '55 5511 7390')
file = URI.open('https://www.labodega.rest/images/galeria/1/1.jpg')
@place3.photos.attach(io: file, filename: 'labodega.jpg', content_type: 'image/png')
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
@review1.save!


@review2= Review.new(content: 'Alot of Variety, best songs out! Awesome vibe.', rating: 5)
@review2.user = @user2
@review2.place = @place2
@review2.save!
genre_review2 = GenresReview.new
genre_review2.review = @review2
genre_review2.genre = Genre.find_by(name: 'rock')
genre_review2.save


@review3 = Review.new(content: 'Amazing Electronic music, delicious food.', rating: 5)
@review3.user = @user2
@review3.place = @place2
@review3.save!
genre_review3 = GenresReview.new
genre_review3.review = @review3
genre_review3.genre = Genre.find_by(name: 'pop')
genre_review3.save

puts "Finished"

puts "Creating 5 more places!"
@place4 = Place.new(name: 'Venturi', top_genre: 'Soul', category: 'Bar', address: 'Goshen, Indiana, United States', description: 'Cozy hangout spot with good Soul Music', phone_number: '55 1845 9513')
place4_picture = URI.open('https://images.squarespace-cdn.com/content/v1/52f12ea6e4b07a35a2f94fd7/1391551486776-TX3ZQXDEW39FF6KH6JB1/ke17ZwdGBToddI8pDm48kLkXF2pIyv_F2eUT9F60jBl7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0iyqMbMesKd95J-X4EagrgU9L3Sa3U8cogeb0tjXbfawd0urKshkc5MgdBeJmALQKw/venturi-interior.jpg')
@place4.photos.attach(io: place4_picture, filename: 'venturi.jpg', content_type: 'image/png')
place42_picture = URI.open('https://images.squarespace-cdn.com/content/v1/52f12ea6e4b07a35a2f94fd7/1391712981281-Z4IVE7Y0NH9YAYEL6LVZ/ke17ZwdGBToddI8pDm48kNe6zOZTHfz7l6ZgjxUpukVZw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZamWLI2zvYWH8K3-s_4yszcp2ryTI0HqTOaaUohrI8PI_yASvo-WEqohroAwDGiHyF2S9ug-6_kqb0gBNu81ch4KMshLAGzx4R3EDFOm1kBS/three-margherite.jpg')
@place4.photos.attach(io: place42_picture, filename: 'venturi-2.jpg', content_type: 'image/png')
place43_picture = URI.open('https://cdn.usarestaurants.info/assets/uploads/f5d70eb642fcc334923ac860c95dcf5e_-united-states-indiana-elkhart-county-elkhart-township-goshen-venturi-574-485-2985htm.jpg')
@place4.photos.attach(io: place43_picture, filename: 'venturi-3.jpg', content_type: 'image/png')
@place4.user = @user1
@place4.save!

@place5 = Place.new(name: 'Common Spirits', top_genre: 'Soul', category: 'Bar', address: 'Ligoneer, Indiana, United States', description: 'Cozy hangout spot with good Soul Music', phone_number: '55 1845 9513')
place5_picture = URI.open('https://commonspirits.com/wp-content/uploads/2014/12/IMG_20160520_110210-1.jpg')
@place5.photos.attach(io: place5_picture, filename: 'common-spirits-1.jpg', content_type: 'image/png')
@place5.user = @user1
@place5.save!

@place6 = Place.new(name: 'Constant Spring', top_genre: 'Soul', category: 'Bar', address: 'New Paris, Indiana, United States', description: 'Cozy hangout spot with good Soul Music', phone_number: '55 1845 9513')
place6_picture = URI.open('https://bloximages.newyork1.vip.townnews.com/southbendtribune.com/content/tncms/assets/v3/editorial/b/0a/b0a7bbc2-ed8e-5801-b0f4-0c70dd137ced/55e8158422eee.image.jpg?crop=543%2C543%2C128%2C0&resize=1200%2C1200&order=crop%2Cresize')
@place6.photos.attach(io: place6_picture, filename: 'constant-spring-1.jpg', content_type: 'image/png')
@place6.user = @user1
@place6.save!

@place7 = Place.new(name: 'Goshen Brewing Company', top_genre: 'Soul', category: 'Bar', address: 'Elkhart, Indiana, United States', description: 'Cozy hangout spot with good Soul Music', phone_number: '55 1845 9513')
place7_picture = URI.open('https://goshenbrewing.com/wp-content/uploads/2015/05/1080-goshen-brewing-8.jpg')
@place7.photos.attach(io: place7_picture, filename: 'goshen-brewing-1.jpg', content_type: 'image/png')
@place7.user = @user1
@place7.save!

@place8 = Place.new(name: 'The Electric Brew', top_genre: 'jazz', category: 'Coffee', address: '118 E. Washington St, Goshen, IN, USA', description: 'Mostly jazz, ambient, acoustic, and indie-rock played here, with a cozy vibe.', phone_number: '(574) 555-0911')
file = URI.open('https://lh5.googleusercontent.com/p/AF1QipMxOWat0FjGXxAd8FBWyHgRd2IECqEtVPPlCSF0=w600-h485-p-k-no')
@place8.photos.attach(io: file, filename: 'electricbrew.png', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1578499026171-a1016496b7f5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60')
@place8.photos.attach(io: file, filename: 'coffeeshop.png', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/flagged/photo-1563855078923-9cb686dc0e7a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
@place8.photos.attach(io: file, filename: 'coffee.png', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1521017432531-fbd92d768814?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60')
@place8.photos.attach(io: file, filename: 'coffeeambiance.png', content_type: 'image/png')
@place8.user = @user3
@place8.save!
puts "Finished!"

# Reviews for Venturi
puts "Creating 3 reviews"
@review4 = Review.new(content: 'Excelent soul music, I danced all night', rating: 5)
@review4.place = @place4
@review4.user = @user2
@review4.save!
genre_review4 = GenresReview.new
genre_review4.review = @review4
genre_review4.genre = Genre.find_by(name: 'soul')
genre_review4.save
@review4.save!

@review5 = Review.new(content: 'Music was excelent, but the service can be better', rating: 3)
@review5.place = @place4
@review5.user = @user2
@review5.save!
genre_review5 = GenresReview.new
genre_review5.review = @review5
genre_review5.genre = Genre.find_by(name: 'soul')
genre_review5.save
@review5.save!

@review6 = Review.new(content: 'Al Green marathon, freaking awesome!', rating: 5)
@review6.place = @place4
@review6.user = @user2
@review6.save!
genre_review5 = GenresReview.new
genre_review5.review = @review6
genre_review5.genre = Genre.find_by(name: 'soul')
genre_review5.save
@review6.save!

puts 'Finished'

puts 'Creating 3 favorites'

@favorite1 = Favorite.new
@favorite1.user = @user1
@favorite1.place = @place1
@favorite1.save!

@favorite2 = Favorite.new
@favorite2.user = @user1
@favorite2.place = @place2
@favorite2.save!

@favorite3 = Favorite.new
@favorite3.user = @user1
@favorite3.place = @place3
@favorite3.save!

puts 'Finished'