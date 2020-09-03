# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

puts "Destroying existing genres reviews"
@genres = GenresReview.all
@genres.each do |genre|
  genre.destroy
end

puts "Destroying existing genres"
@genres = Genre.all
@genres.each do |genre|
  genre.destroy
end

puts 'Destroying existing places'
@places = Place.all
@places.each do |place|
  place.photos.purge if place.photos.attached?
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
  "art pop",
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

puts 'Creating 3 places'
@place1 = Place.new(name: 'Taqueria San Marcos', top_genre: 'rock', category: 'Nightclub', address: '113 S. Main St., Goshen, IN', description:"You'll love the reggaeton and dance music here! Great patio, tacos, as well!", phone_number: '55 1845 9513')
file = URI.open('https://www.dondeir.com/wp-content/uploads/2019/03/cafe-taco-bar-barra.jpg')
@place1.photos.attach(io: file, filename: 'taco-bar.jpg', content_type: 'image/png')
file = URI.open('https://scontent-ort2-1.xx.fbcdn.net/v/t1.0-9/19247794_881425275342861_148534934067197032_n.jpg?_nc_cat=101&_nc_sid=9267fe&_nc_ohc=_EX_r2T0IxkAX9sffJ3&_nc_ht=scontent-ort2-1.xx&oh=49c1926d11b4ae4ba28a6ad80f126c0a&oe=5F751C71')
@place1.photos.attach(io: file, filename: 'taco-bar2.jpg', content_type: 'image/png')
file = URI.open('https://scontent-ort2-1.xx.fbcdn.net/v/t1.0-9/37600726_10157672821638761_282030556500197376_o.jpg?_nc_cat=101&_nc_sid=8bfeb9&_nc_ohc=1cM1NQVCZbEAX9yPhPv&_nc_ht=scontent-ort2-1.xx&oh=35e514997d2153ef13898b76b9151faa&oe=5F7457F9')
@place1.photos.attach(io: file, filename: 'taco-bar3.jpg', content_type: 'image/png')
@place1.user = @user1
@place1.save!

@place2 = Place.new(name: 'Gin Gin', top_genre: 'dance', category: 'Bar', address: 'Granada, Miguel Hidalgo, 11529 Ciudad de México, CDMX, Mexico', description: 'Great dance music and reggaeton! Kitchen Bar specializes in gin cocktails', phone_number: '55 5248 0911')
file = URI.open('https://gingin.mx/repository/imagenes/siteUbicacion/3/_MG_6749.jpg')
@place2.photos.attach(io: file, filename: 'g1.png', content_type: 'image/png')
file = URI.open('https://fastly.4sqi.net/img/general/200x200/156020961_g4F844ile81RCR0bOrOnAHYuMI10UBmLmORCglDoxqM.jpg')
@place2.photos.attach(io: file, filename: 'g2.png', content_type: 'image/png')
file = URI.open('https://i.ytimg.com/vi/wLgb5L84uiI/maxresdefault.jpg')
@place2.photos.attach(io: file, filename: 'g3.png', content_type: 'image/png')
@place2.user = @user1
@place2.save!

@place3 = Place.new(name: 'La Bodega', top_genre: 'latin', category: 'Restaurant', address: 'Miguel Hidalgo, 11800 CDMX, Mexico', url: 'https://www.labodega.rest/', description: 'Mexican Restaurant with traditional music', phone_number: '55 5511 7390')
file = URI.open('https://www.labodega.rest/images/galeria/1/1.jpg')
@place3.photos.attach(io: file, filename: 'labodega.jpg', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/flagged/photo-1579941429125-4be1ab232711?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60')
@place3.photos.attach(io: file, filename: 'labodega2.jpg', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1589769105893-3cfe4c0c8851?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60')
@place3.photos.attach(io: file, filename: 'labodega3.jpg', content_type: 'image/png')
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

puts "Creating 5 Goshen places!"
@place4 = Place.new(name: 'Venturi', top_genre: 'Soul', category: 'Bar', address: '123 E. Lincoln, Goshen, Indiana, United States', description: 'Cozy hangout spot with good Soul Music', phone_number: '55 1845 9513')
file = URI.open('https://images.squarespace-cdn.com/content/v1/52f12ea6e4b07a35a2f94fd7/1391551486776-TX3ZQXDEW39FF6KH6JB1/ke17ZwdGBToddI8pDm48kLkXF2pIyv_F2eUT9F60jBl7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0iyqMbMesKd95J-X4EagrgU9L3Sa3U8cogeb0tjXbfawd0urKshkc5MgdBeJmALQKw/venturi-interior.jpg')
@place4.photos.attach(io: file, filename: 'venturi.jpg', content_type: 'image/png')
file = URI.open('https://images.squarespace-cdn.com/content/v1/52f12ea6e4b07a35a2f94fd7/1391712981281-Z4IVE7Y0NH9YAYEL6LVZ/ke17ZwdGBToddI8pDm48kNe6zOZTHfz7l6ZgjxUpukVZw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZamWLI2zvYWH8K3-s_4yszcp2ryTI0HqTOaaUohrI8PI_yASvo-WEqohroAwDGiHyF2S9ug-6_kqb0gBNu81ch4KMshLAGzx4R3EDFOm1kBS/three-margherite.jpg')
@place4.photos.attach(io: file, filename: 'venturi-2.jpg', content_type: 'image/png')
file = URI.open('https://cdn.usarestaurants.info/assets/uploads/f5d70eb642fcc334923ac860c95dcf5e_-united-states-indiana-elkhart-county-elkhart-township-goshen-venturi-574-485-2985htm.jpg')
@place4.photos.attach(io: file, filename: 'venturi-3.jpg', content_type: 'image/png')
@place4.user = @user1
@place4.save!

@place5 = Place.new(name: 'Common Spirits', top_genre: 'Soul', category: 'Bar', address: '111 E. Lincoln Ave, Goshen Indiana, United States', description: 'Cozy hangout spot with good Soul Music', phone_number: '55 1845 9513')
file = URI.open('https://commonspirits.com/wp-content/uploads/2014/12/IMG_20160520_110210-1.jpg')
@place5.photos.attach(io: file, filename: 'common-spirits-1.jpg', content_type: 'image/png')
file = URI.open('https://commonspirits.com/wp-content/uploads/2014/12/IMG_20160609_133357.jpg')
@place5.photos.attach(io: file, filename: 'common-spirits-2.jpg', content_type: 'image/png')
file = URI.open('https://commonspirits.com/wp-content/uploads/2014/12/IMG_20160520_124533.jpg')
@place5.photos.attach(io: file, filename: 'common-spirits-3.jpg', content_type: 'image/png')
@place5.user = @user1
@place5.save!

@place6 = Place.new(name: 'Constant Spring', top_genre: 'Soul', category: 'Bar', address: '219 S. Main St, Goshen Indiana, United States', description: 'Cozy hangout spot with good Soul Music', phone_number: '55 1845 9513')
file = URI.open('https://bloximages.newyork1.vip.townnews.com/southbendtribune.com/content/tncms/assets/v3/editorial/b/0a/b0a7bbc2-ed8e-5801-b0f4-0c70dd137ced/55e8158422eee.image.jpg?crop=543%2C543%2C128%2C0&resize=1200%2C1200&order=crop%2Cresize')
@place6.photos.attach(io: file, filename: 'constant-spring-1.jpg', content_type: 'image/png')
file = URI.open('https://scontent-ort2-1.xx.fbcdn.net/v/t1.0-9/118215013_10157882671363214_5593952434385893705_o.jpg?_nc_cat=109&_nc_sid=9267fe&_nc_ohc=wHXGktzkN2oAX9lUvtf&_nc_ht=scontent-ort2-1.xx&oh=4473102d5f097f2b3fc712bc96cad635&oe=5F75DC60')
@place6.photos.attach(io: file, filename: 'constant-spring-2.jpg', content_type: 'image/png')
file = URI.open('https://scontent-ort2-1.xx.fbcdn.net/v/t1.0-9/103256447_10157663196388214_7798530207763132223_o.jpg?_nc_cat=111&_nc_sid=730e14&_nc_ohc=pVldq05eMpwAX_G0UIs&_nc_ht=scontent-ort2-1.xx&oh=b7c8eca4a32ca5affcd32beeb08b37de&oe=5F75D11F')
@place6.photos.attach(io: file, filename: 'constant-spring-3.jpg', content_type: 'image/png')
@place6.user = @user1
@place6.save!

@place7 = Place.new(name: 'Goshen Brewing Company', top_genre: 'Soul', category: 'Bar', address: '315 W. Washington St.,Goshen, Indiana, United States', description: 'Cozy hangout spot with good Soul Music', phone_number: '55 1845 9513')
file = URI.open('https://goshenbrewing.com/wp-content/uploads/2015/05/1080-goshen-brewing-8.jpg')
@place7.photos.attach(io: file, filename: 'goshen-brewing-1.jpg', content_type: 'image/png')
file = URI.open('https://scontent-ort2-1.xx.fbcdn.net/v/t1.0-0/c34.0.206.206a/p206x206/105654352_1886314034865335_848628426071560408_o.jpg?_nc_cat=110&_nc_sid=110474&_nc_ohc=7YC2aMavQfQAX-XvjjP&_nc_ht=scontent-ort2-1.xx&oh=5296af7bdc7492fb3fa0f549dd247f70&oe=5F771FE5')
@place7.photos.attach(io: file, filename: 'goshen-brewing-2.jpg', content_type: 'image/png')
file = URI.open('https://scontent-ort2-1.xx.fbcdn.net/v/t1.0-0/c32.0.206.206a/p206x206/89924300_759033684238_1481289376636862464_n.jpg?_nc_cat=107&_nc_sid=de0e5b&_nc_ohc=SV8rd_reYOwAX_B7RgL&_nc_ht=scontent-ort2-1.xx&oh=e8456e31cb3313ab16eb1bc11c48e40d&oe=5F7571FD')
@place7.photos.attach(io: file, filename: 'goshen-brewing-3.jpg', content_type: 'image/png')
@place7.user = @user1
@place7.save!

@place8 = Place.new(name: 'The Electric Brew', top_genre: 'jazz', category: 'Coffee', address: '118 E. Washington St, Goshen, IN, USA', description: 'Mostly jazz, ambient, acoustic, and indie-rock played here, with a cozy vibe.', phone_number: '(574) 555-0911')
file = URI.open('https://lh5.googleusercontent.com/p/AF1QipMxOWat0FjGXxAd8FBWyHgRd2IECqEtVPPlCSF0=w600-h485-p-k-no')
@place8.photos.attach(io: file, filename: 'electricbrew.png', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1578499026171-a1016496b7f5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60')
@place8.photos.attach(io: file, filename: 'coffeeshop.png', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1521017432531-fbd92d768814?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60')
@place8.photos.attach(io: file, filename: 'coffeeambiance.png', content_type: 'image/png')
@place8.user = @user2
@place8.save!
puts "Finished!"

puts "Creating 5 CDMX places!"
@place11 = Place.new(name: 'Solis', top_genre: 'jazz', category: 'Bar', address: 'Condesa, Mexico City', description: 'Cozy hangout spot with good jazz music', phone_number: '55 1845 9513')
file = URI.open('https://images.unsplash.com/photo-1514933651103-005eec06c04b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
@place11.photos.attach(io: file, filename: 'brownbar.jpg', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1485872299829-c673f5194813?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
@place11.photos.attach(io: file, filename: 'cocktailslaughing.jpg', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1577099636826-7a532667d518?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
@place11.photos.attach(io: file, filename: 'soul3.jpg', content_type: 'image/png')
@place11.user = @user2
@place11.save!

@place9 = Place.new(name: 'Los Primos', top_genre: 'rock', category: 'Bar', address: 'Cuauhtémoc, 06700 Ciudad de México, CDMX, Mexico', description: 'Great spot with awesome rock music! Classic rock until 9:00pm, hard rock and metal into the night!', phone_number: '55 1847 9513')
file = URI.open('https://images.unsplash.com/photo-1570936100858-56eb3a5f5ae1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
@place9.photos.attach(io: file, filename: 'rockbar1.jpg', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1565755713428-1bdfaa7db8ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
@place9.photos.attach(io: file, filename: 'rockbar2.jpg', content_type: 'image/png')
file = URI.open('https://commonspirits.com/wp-content/uploads/2014/12/IMG_20160520_124533.jpg')
@place9.photos.attach(io: file, filename: 'common-spirits-3.jpg', content_type: 'image/png')
@place9.user = @user2
@place9.save!

@place10 = Place.new(name: "Limon", top_genre: 'pop', category: 'restaurant', address: 'Roma Sur, Cuauhtémoc, 06760 Ciudad de México, CDMX, Mexico', description: 'Cozy hangout spot with good Soul Music', phone_number: '55 1897 9513')
file = URI.open('https://images.unsplash.com/photo-1530119412657-4f6cd87aad79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
@place10.photos.attach(io: file, filename: 'limon1.jpg', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1554917134-21e9f7431d08?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
@place10.photos.attach(io: file, filename: 'limon2.jpg', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1553194588-6ba2cd5b410f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
@place10.photos.attach(io: file, filename: 'limon3.jpg', content_type: 'image/png')
@place10.user = @user2
@place10.save!

@place12 = Place.new(name: 'Cafe Discoteq', top_genre: 'reggaeton', category: 'Nightclub', address: 'Hipódromo Condesa, Cuauhtémoc, 06170 Ciudad de México, CDMX, Mexico', description: 'Cozy hangout spot with good Soul Music', phone_number: '55 1845 9513')
file = URI.open('https://images.unsplash.com/photo-1566737236500-c8ac43014a67?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
@place12.photos.attach(io: file, filename: 'cafediscoteq1.jpg', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1516460541734-4d739711d218?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
@place12.photos.attach(io: file, filename: 'cafediscoteq2.jpg', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1569924995012-c4c706bfcd51?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
@place12.photos.attach(io: file, filename: 'cafediscoteq3.jpg', content_type: 'image/png')
@place12.user = @user2
@place12.save!

@place13 = Place.new(name: "Frida's", top_genre: 'latin', category: 'Coffee', address: 'Del Carmen, Coyoacán, 04100 Ciudad de México, CDMX, Mexico', description: "Mostly music with latin flavors played here, a cozy vibe Frida would've loved.", phone_number: '(574) 555-0911')
file = URI.open('https://images.unsplash.com/photo-1453614512568-c4024d13c247?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
@place13.photos.attach(io: file, filename: 'fridas.png', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1578499026171-a1016496b7f5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60')
@place13.photos.attach(io: file, filename: 'coffeeshop.png', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1521017432531-fbd92d768814?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60')
@place13.photos.attach(io: file, filename: 'coffeeambiance.png', content_type: 'image/png')
@place13.user = @user2
@place13.save!

puts "Finished!"

# Reviews for Venturi
puts "Creating 3 Venturi reviews"
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
genre_review6 = GenresReview.new
genre_review6.review = @review6
genre_review6.genre = Genre.find_by(name: 'soul')
genre_review6.save
@review6.save!

puts 'Finished'
puts 'Creating 3 GBCo reviews'

@review7 = Review.new(content: 'Great soul music! Plus great beer and pad thai', rating: 5)
@review7.place = @place7
@review7.user = @user2
@review7.save!
genre_review7 = GenresReview.new
genre_review7.review = @review7
genre_review7.genre = Genre.find_by(name: 'soul')
genre_review7.save
@review7.save!


@review8= Review.new(content: 'Awesome vibe, love their patio seating! So tranquil!', rating: 4)
@review8.user = @user1
@review8.place = @place7
@review8.save!
genre_review8 = GenresReview.new
genre_review8.review = @review8
genre_review8.genre = Genre.find_by(name: 'soul')
genre_review8.save


@review9 = Review.new(content: 'Love the acoustic nights on Wednesdays!', rating: 5)
@review9.user = @user3
@review9.place = @place7
@review9.save!
genre_review9 = GenresReview.new
genre_review9.review = @review9
genre_review9.genre = Genre.find_by(name: 'acoustic')
genre_review9.save

puts "Finished"

puts 'Creating 5 favorites'

@favorite1 = Favorite.new
@favorite1.user = @user1
@favorite1.place = @place1
@favorite1.save!

@favorite2 = Favorite.new
@favorite2.user = @user1
@favorite2.place = @place2
@favorite2.save!

@favorite3 = Favorite.new
@favorite3.user = @user3
@favorite3.place = @place7
@favorite3.save!

@favorite4 = Favorite.new
@favorite4.user = @user3
@favorite4.place = @place8
@favorite4.save!

puts 'Finished'

puts "Creating new reviews for places9-13"
@review10 = Review.new(content: 'Went to the SOAD tribute, awesome night', rating: 5)
@review10.user = @user1
@review10.place = @place9
@review10.save!
genre_review10 = GenresReview.new
genre_review10.review = @review10
genre_review10.genre = Genre.find_by(name: 'rock')
genre_review10.save

@review11 = Review.new(content: 'Pretty chill.', rating: 4)
@review11.user = @user2
@review11.place = @place9
@review11.save!
genre_review11 = GenresReview.new
genre_review11.review = @review11
genre_review11.genre = Genre.find_by(name: 'rock')
genre_review11.save

@review12 = Review.new(content: 'Music is great, had a blast! ', rating: 5)
@review12.user = @user1
@review12.place = @place10
@review12.save!
genre_review12 = GenresReview.new
genre_review12.review = @review12
genre_review12.genre = Genre.find_by(name: 'pop')
genre_review12.save

@review13 = Review.new(content: 'It was good, danced with my friends all night', rating: 4)
@review13.user = @user2
@review13.place = @place10
@review13.save!
genre_review13 = GenresReview.new
genre_review13.review = @review13
genre_review13.genre = Genre.find_by(name: 'pop')
genre_review13.save

@review14 = Review.new(content: 'Music spoke to my soul, cozy place, I loved it', rating: 5)
@review14.user = @user1
@review14.place = @place11
@review14.save!
genre_review14 = GenresReview.new
genre_review14.review = @review14
genre_review14.genre = Genre.find_by(name: 'jazz')
genre_review14.save

@review15 = Review.new(content: 'Good music, cheap drinks, after-office approved!', rating: 5)
@review15.user = @user2
@review15.place = @place11
@review15.save!
genre_review15 = GenresReview.new
genre_review15.review = @review15
genre_review15.genre = Genre.find_by(name: 'jazz')
genre_review15.save

@review16 = Review.new(content: "Poor music. They need a new dj.", rating: 2)
@review16.user = @user1
@review16.place = @place12
@review16.save!
genre_review16 = GenresReview.new
genre_review16.review = @review16
genre_review16.genre = Genre.find_by(name: "reggaeton")
genre_review16.save

@review17 = Review.new(content: "Just amazing! Great vibe, will come back!", rating: 5)
@review17.user = @user2
@review17.place = @place12
@review17.save!
genre_review17 = GenresReview.new
genre_review17.review = @review17
genre_review17.genre = Genre.find_by(name: "reggaeton")
genre_review17.save

@review18 = Review.new(content: "Pretty good music.", rating: 4)
@review18.user = @user1
@review18.place = @place13
@review18.save!
genre_review18 = GenresReview.new
genre_review18.review = @review18
genre_review18.genre = Genre.find_by(name: "latin")
genre_review18.save

@review19 = Review.new(content: "Best latin music in the city! I want to stay all night!", rating: 5)
@review19.user = @user2
@review19.place = @place13
@review19.save!
genre_review19 = GenresReview.new
genre_review19.review = @review19
genre_review19.genre = Genre.find_by(name: "latin")
genre_review19.save

puts "finished!"
