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

puts 'Creating 126 Genres'

genres = [
  "acoustic",
  "afrobeat",
  "alt-rock",
  "alternative",
  "alternative hip hop",
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
  "duluth indie",
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
  "stomp and holler",
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

puts 'Creating 6 Jazz CDMX places!'

@turkana = Place.new(name: 'Turkana Jazz Club', top_genre: 'jazz', category: 'Restaurant', address: 'Colonia Condesa, Cuauhtémoc, 06100 Mexico City, CDMX', description:"Mexican Restaurant with Jazz music.", phone_number: '55 5564 2214')
file = URI.open('https://mxcity.mx/wp-content/uploads/2019/09/turkana-terraza-restaurante-3.jpg')
@turkana.photos.attach(io: file, filename: 'turkana.jpg', content_type: 'image/png')
file = URI.open('https://images.otstatic.com/prod/26043267/1/large.jpg')
@turkana.photos.attach(io: file, filename: 'turkana2.jpg', content_type: 'image/png')
file = URI.open('https://images.otstatic.com/prod/26043268/1/large.jpg')
@turkana.photos.attach(io: file, filename: 'turkana3.jpg', content_type: 'image/png')
@turkana.user = @user1
@turkana.save!

@parkerlenox = Place.new(name: 'Parker and Lenox', top_genre: 'jazz', category: 'Bar', address: 'Juárez, Cuauhtémoc, 06600 Mexico City, CDMX', description:"Very fun, chill American bar!", phone_number: '52 55 5546 6979')
file = URI.open('https://media-cdn.tripadvisor.com/media/photo-s/07/b5/c9/7a/getlstd-property-photo.jpg')
@parkerlenox.photos.attach(io: file, filename: 'parkerlenox.jpg', content_type: 'image/png')
file = URI.open('https://img.chilango.com/2015/06/burlesque-en-parker-lenox.jpg')
@parkerlenox.photos.attach(io: file, filename: 'parkerlenox2.jpg', content_type: 'image/png')
file = URI.open('https://i.pinimg.com/originals/c9/d7/0c/c9d70cb664601e0a101a2d9d8d7f07dc.jpg')
@parkerlenox.photos.attach(io: file, filename: 'parkerlenox3.jpg', content_type: 'image/png')
@parkerlenox.user = @user1
@parkerlenox.save!

@zinco = Place.new(name: 'Zinco', top_genre: 'jazz', category: 'Club', address: 'Historic Center of the Cdad. de México, Centro, Cuauhtémoc, 06050 Mexico City, CDMX', description:"One of the most prestigous venues in Mexico City.", phone_number: '55 1131 7760')
file = URI.open('https://media.timeout.com/images/101224003/image.jpg')
@zinco.photos.attach(io: file, filename: 'zinco.jpg', content_type: 'image/png')
file = URI.open('https://media.gq.com/photos/59079e1e9fec29371ec9dc11/master/w_3640,h_2427,c_limit/mexico-city-speakeasies-Zinco-Jazz-Club-edit.jpg')
@zinco.photos.attach(io: file, filename: 'zinco2.jpg', content_type: 'image/png')
file = URI.open('https://www.telegraph.co.uk/content/dam/Travel/Destinations/Central%20America/Hotels%20-%20Mexico/Mexico-city/zinco-mexico-city-nightlife.jpg?imwidth=480')
@zinco.photos.attach(io: file, filename: 'zinco3.jpg', content_type: 'image/png')
@zinco.user = @user1
@zinco.save!

@pizzajazz = Place.new(name: 'Pizza Jazz Cafe', top_genre: 'jazz', category: 'Cafe', address: 'Portales Oriente, Benito Juárez, 03303 Mexico City, CDMX', description:"Great Pizza, Great Jazz. What more could you ask for?", phone_number: '55 2736 7912')
file = URI.open('https://canalonce.mx/itinerario/wp-content/uploads/2016/12/1-5-290x290.jpg')
@pizzajazz.photos.attach(io: file, filename: 'pizzajazz.jpg', content_type: 'image/png')
file = URI.open('https://media.timeout.com/images/101221345/630/472/image.jpg')
@pizzajazz.photos.attach(io: file, filename: 'pizzajazz2.jpg', content_type: 'image/png')
file = URI.open('https://media.timeout.com/images/101221347/630/472/image.jpg')
@pizzajazz.photos.attach(io: file, filename: 'pizzajazz3.jpg', content_type: 'image/png')
@pizzajazz.user = @user2
@pizzajazz.save!

@casafranca = Place.new(name: 'Casa Franca', top_genre: 'jazz', category: 'Bar', address: 'Roma Nte., Cuauhtémoc, 06700 Ciudad de México, CDMX', description:"Cozy Jazz and Blues Club with Cocktails and Food.", phone_number: '55 5208 2265')
file = URI.open('https://scontent.fmid1-2.fna.fbcdn.net/v/t31.0-8/26756576_1819998221368035_4026337139604838043_o.jpg?_nc_cat=103&_nc_sid=e3f864&_nc_ohc=oikB1TBkdUEAX_-f7Jx&_nc_ht=scontent.fmid1-2.fna&oh=87a77c4606736fd85704de294aa8f87c&oe=5F783CF0')
@casafranca.photos.attach(io: file, filename: 'casafranca.jpg', content_type: 'image/png')
file = URI.open('https://scontent.fmid1-1.fna.fbcdn.net/v/t31.0-8/22528882_1726676340700224_4740388024434799474_o.jpg?_nc_cat=104&_nc_sid=e3f864&_nc_ohc=2MzxxYgMqOoAX8uz6kH&_nc_ht=scontent.fmid1-1.fna&oh=cae5c619f225f78bc848dd33a0062e73&oe=5F792477')
@casafranca.photos.attach(io: file, filename: 'casafranca2.jpg', content_type: 'image/png')
file = URI.open('https://mxcity.mx/wp-content/uploads/2019/09/casa-franca.jpg')
@casafranca.photos.attach(io: file, filename: 'casafranca3.jpg', content_type: 'image/png')
@casafranca.user = @user2
@casafranca.save!

@elconvite = Place.new(name: 'El Convite Inn and Coffee', top_genre: 'jazz', category: 'Restaurant', address: 'Portales Sur, Benito Juárez, 03300 Mexico City, CDMX', description:"Family owned Restaurant with Jazz on Wheels.", phone_number: '55 5601 2260')
file = URI.open('http://elconvite.com.mx/wp-content/uploads/2020/05/64600809_10161637476235276_6039714510648901632_o-1024x686.jpg')
@elconvite.photos.attach(io: file, filename: 'elconvite.jpg', content_type: 'image/png')
file = URI.open('http://elconvite.com.mx/wp-content/uploads/2020/05/64561546_10161637474685276_4732300670172921856_o-1024x768.jpg')
@elconvite.photos.attach(io: file, filename: 'elconvite2.jpg', content_type: 'image/png')
file = URI.open('http://elconvite.com.mx/wp-content/uploads/2020/05/59872777_10161476112955276_4579957694852497408_n.jpg')
@elconvite.photos.attach(io: file, filename: 'elconvite3.jpg', content_type: 'image/png')
@elconvite.user = @user2
@elconvite.save!

puts 'Listo!'

puts 'Creating 6 CDMX Rock Places'

@valiant = Place.new(name: 'Valiant', top_genre: 'rock', category: 'Bar', address: 'Colonia Centro, Centro, Cuauhtémoc, 06000 Ciudad de México, CDMX', description:"A pub with local rock music", phone_number: '55 5510 1540')
file = URI.open('https://media.timeout.com/images/103264658/630/472/image.jpg')
@valiant.photos.attach(io: file, filename: 'valiant.jpg', content_type: 'image/png')
file = URI.open('https://s3-media0.fl.yelpcdn.com/bphoto/M2f8y-ZpL3PYT6cQ-xQQ5w/ls.jpg')
@valiant.photos.attach(io: file, filename: 'valiant2.jpg', content_type: 'image/png')
file = URI.open('https://mxcity.mx/wp-content/uploads/2016/05/Valiant-Pub.png')
@valiant.photos.attach(io: file, filename: 'valiant3.jpg', content_type: 'image/png')
@valiant.user = @user1
@valiant.save!

@sixtiesbar = Place.new(name: 'Sixties Bar', top_genre: 'rock', category: 'bar', address: 'Colonia Condesa, Cuauhtémoc, 06140 Mexico City, CDMX', description:"A restaurant with a 60's theme.", phone_number: '55 5264 5069')
file = URI.open('https://scontent.fmid1-1.fna.fbcdn.net/v/t1.0-9/84464346_2668509119922854_652723643310145536_o.jpg?_nc_cat=108&_nc_sid=9267fe&_nc_ohc=pkZ-Iqk4AskAX8yczLd&_nc_ht=scontent.fmid1-1.fna&oh=27220f107af74cc20798e8c9e1820451&oe=5F766A27')
@sixtiesbar.photos.attach(io: file, filename: 'sixtiesbar.jpg', content_type: 'image/png')
file = URI.open('https://scontent-qro1-1.xx.fbcdn.net/v/t1.0-9/85026393_2664432320330534_8526072491347542016_o.jpg?_nc_cat=107&_nc_sid=a26aad&_nc_ohc=r-Z_FS0rDVMAX-ncOlG&_nc_ht=scontent-qro1-1.xx&oh=2516c4b309dead87a5d764ad31b5bd9b&oe=5F78E7A8')
@sixtiesbar.photos.attach(io: file, filename: 'sixtiesbar2.jpg', content_type: 'image/png')
file = URI.open('https://resizer.otstatic.com/v2/photos/xlarge/1/23692860.jpg')
@sixtiesbar.photos.attach(io: file, filename: 'sixtiesbar3.jpg', content_type: 'image/png')
@sixtiesbar.user = @user2
@sixtiesbar.save!

@bebop = Place.new(name: 'Be Bops Diner', top_genre: 'rock', category: 'restaurant', address: 'Roma Nte., Cuauhtémoc, 06700 Mexico City, CDMX', description:"An American Restaurant featuring Rock and Roll!", phone_number: '55 6586 3449')
file = URI.open('https://media-cdn.tripadvisor.com/media/photo-s/17/e3/db/8c/be-bops-diner.jpg')
@bebop.photos.attach(io: file, filename: 'bebop.jpg', content_type: 'image/png')
file = URI.open('https://media.timeout.com/images/103765252/630/472/image.jpg')
@bebop.photos.attach(io: file, filename: 'bebop2.jpg', content_type: 'image/png')
file = URI.open('https://media.timeout.com/images/103765251/image.jpg')
@bebop.photos.attach(io: file, filename: 'bebop3.jpg', content_type: 'image/png')
@bebop.user = @user1
@bebop.save!

@gatocalavera = Place.new(name: 'Gato Calavera', top_genre: 'rock', category: 'bar', address: 'Hipódromo, Cuauhtémoc, 06100 Ciudad de México, CDMX', description:"Bar featuring Rock music.", phone_number: '55 4633 3246')
file = URI.open('https://i.pinimg.com/originals/53/13/1d/53131d3ca4b2fdb4ca8a1d8e59c2b516.jpg')
@gatocalavera.photos.attach(io: file, filename: 'gatocalavera.jpg', content_type: 'image/png')
file = URI.open('https://pbs.twimg.com/media/Ef6EWLWXYAAnYaa.jpg')
@gatocalavera.photos.attach(io: file, filename: 'gatocalavera2.jpg', content_type: 'image/png')
file = URI.open('https://media.timeout.com/images/103957382/630/472/image.jpg')
@gatocalavera.photos.attach(io: file, filename: 'gatocalavera3.jpg', content_type: 'image/png')
@gatocalavera.user = @user1
@gatocalavera.save!

@rockson = Place.new(name: 'Rock Son', top_genre: 'rock', category: 'bar', address: 'Madero 20, Centro Histórico de la Cdad. de México, Centro, Cuauhtémoc, 06000 Ciudad de México, CDMX', description:"A bar with live rock music", phone_number: '55 5512 0781')
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTTJ4WBK3Aln6npEqirVM9dghBrvN8whOLUdQ&usqp=CAU')
@rockson.photos.attach(io: file, filename: 'rockson.jpg', content_type: 'image/png')
file = URI.open('https://i.ytimg.com/vi/5d7HJRM0oJQ/maxresdefault.jpg')
@rockson.photos.attach(io: file, filename: 'rockson2.jpg', content_type: 'image/png')
file = URI.open('https://2.kekantoimg.com/tmkwUKlkWCWejE8NB_CCdzAVaL0=/360x360/s3.amazonaws.com/kekanto_pics/pics/422/792422.jpg')
@rockson.photos.attach(io: file, filename: 'rockson3.jpg', content_type: 'image/png')
@rockson.user = @user1
@rockson.save!

@bizarrocafe = Place.new(name: 'Bizarro Cafe', top_genre: 'rock', category: 'bar', address: 'Roma Nte., Cuauhtémoc, 06700 Ciudad de México, CDMX', description:"Bar featuring Rock music.", phone_number: '55 5264 3411')
file = URI.open('https://3.bp.blogspot.com/-61EzXkDm8x4/VPJeiy7cdoI/AAAAAAAAEBM/Q3w40JnhxpU/s1600/bizarro_mexipop_city.JPG')
@bizarrocafe.photos.attach(io: file, filename: 'bizarrocafe.jpg', content_type: 'image/png')
file = URI.open('https://fastly.4sqi.net/img/general/600x600/7DA5oAjl0oJ4F-FMzZ4Dkfd_tkfhRBbo-33Y2_I_Rbw.jpg')
@bizarrocafe.photos.attach(io: file, filename: 'bizarrocafe2.jpg', content_type: 'image/png')
file = URI.open('https://www.reporteindigo.com/wp-content/uploads/2019/07/IMG_0110-660x440.jpg')
@bizarrocafe.photos.attach(io: file, filename: 'bizarrocafe3.jpg', content_type: 'image/png')
@bizarrocafe.user = @user1
@bizarrocafe.save!

puts 'Finished!'

puts 'Creating Gosh damn Places!'

@wingsetc = Place.new(name: 'Wings Etc', top_genre: 'rock', category: 'bar', address: '2815 Gateway S Dr, Goshen, IN 46526, United States', description:"Chain pub known for great rock, classic rock, and alternative music. Plus there's chicken wings & variety of sauces, sports on TV & video games.", phone_number: '574-537-9464')
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRpzI0lgfVhuz3khWpo4qf8lAvW-6B_7KM_Cg&usqp=CAU')
@wingsetc.photos.attach(io: file, filename: 'wingsetc.jpg', content_type: 'image/png')
file = URI.open('https://pbs.twimg.com/media/DtwCeTrWkAEU1TO.jpg')
@wingsetc.photos.attach(io: file, filename: 'wingsetc2.jpg', content_type: 'image/png')
file = URI.open('https://cdn.usarestaurants.info/assets/uploads/f883c58d0bf5543f2304797b9266ffcc_-united-states-indiana-elkhart-county-elkhart-township-goshen-wings-etc-574-537-9464htm.jpg')
@wingsetc.photos.attach(io: file, filename: 'wingsetc3.jpg', content_type: 'image/png')
@wingsetc.user = @user1
@wingsetc.save!

@ignitiongarage = Place.new(name: 'Ignition Garage', top_genre: 'rock', category: 'bar', address: '120 E Washington St, Goshen, IN 46528, United States', description:"Former garage turned music store/bar/venue, you'll love the indie rock/pop, jazz, and soul music played here!", phone_number: '574-971-8282')
file = URI.open('https://bloximages.newyork1.vip.townnews.com/southbendtribune.com/content/tncms/assets/v3/editorial/7/59/759cdf7a-f74d-11e3-b99d-0017a43b2370/53a236c4ddaeb.image.jpg')
@ignitiongarage.photos.attach(io: file, filename: 'ignitiongarage.jpg', content_type: 'image/png')
file = URI.open('https://68.media.tumblr.com/4567f9fdcd93b1b47b32f97608e74421/tumblr_or3tyfToPv1u80zz9o1_500.jpg')
@ignitiongarage.photos.attach(io: file, filename: 'ignitiongarage2.jpg', content_type: 'image/png')
file = URI.open('https://record.goshen.edu/wp-content/uploads/2016/11/Features-Ignition-KM-640x426.jpg')
@ignitiongarage.photos.attach(io: file, filename: 'ignitiongarage3.jpg', content_type: 'image/png')
@ignitiongarage.user = @user1
@ignitiongarage.save!

puts 'Listo!'

puts "Creating 10 Goshen places!"
@place1 = Place.new(name: 'Taqueria San Marcos', top_genre: 'latin', category: 'Restaurant', address: '113 S. Main St., Goshen, IN', description:"You'll love the latin, reggaeton, and dance music here! Great tacos, as well!", phone_number: '55 1845 9513')
file = URI.open('https://www.dondeir.com/wp-content/uploads/2019/03/cafe-taco-bar-barra.jpg')
@place1.photos.attach(io: file, filename: 'taco-bar.jpg', content_type: 'image/png')
file = URI.open('https://scontent-ort2-1.xx.fbcdn.net/v/t1.0-9/19247794_881425275342861_148534934067197032_n.jpg?_nc_cat=101&_nc_sid=9267fe&_nc_ohc=_EX_r2T0IxkAX9sffJ3&_nc_ht=scontent-ort2-1.xx&oh=49c1926d11b4ae4ba28a6ad80f126c0a&oe=5F751C71')
@place1.photos.attach(io: file, filename: 'taco-bar2.jpg', content_type: 'image/png')
file = URI.open('https://scontent-ort2-1.xx.fbcdn.net/v/t1.0-9/37600726_10157672821638761_282030556500197376_o.jpg?_nc_cat=101&_nc_sid=8bfeb9&_nc_ohc=1cM1NQVCZbEAX9yPhPv&_nc_ht=scontent-ort2-1.xx&oh=35e514997d2153ef13898b76b9151faa&oe=5F7457F9')
@place1.photos.attach(io: file, filename: 'taco-bar3.jpg', content_type: 'image/png')
@place1.user = @user1
@place1.save!

@place4 = Place.new(name: 'Venturi', top_genre: 'pop', category: 'Restaurant', address: '123 E. Lincoln, Goshen, Indiana, United States', description: 'Good indie/art pop, plus soul music! Also the pizza is divine!', phone_number: '55 1845 9513')
file = URI.open('https://images.squarespace-cdn.com/content/v1/52f12ea6e4b07a35a2f94fd7/1391551486776-TX3ZQXDEW39FF6KH6JB1/ke17ZwdGBToddI8pDm48kLkXF2pIyv_F2eUT9F60jBl7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0iyqMbMesKd95J-X4EagrgU9L3Sa3U8cogeb0tjXbfawd0urKshkc5MgdBeJmALQKw/venturi-interior.jpg')
@place4.photos.attach(io: file, filename: 'venturi.jpg', content_type: 'image/png')
file = URI.open('https://images.squarespace-cdn.com/content/v1/52f12ea6e4b07a35a2f94fd7/1391712981281-Z4IVE7Y0NH9YAYEL6LVZ/ke17ZwdGBToddI8pDm48kNe6zOZTHfz7l6ZgjxUpukVZw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZamWLI2zvYWH8K3-s_4yszcp2ryTI0HqTOaaUohrI8PI_yASvo-WEqohroAwDGiHyF2S9ug-6_kqb0gBNu81ch4KMshLAGzx4R3EDFOm1kBS/three-margherite.jpg')
@place4.photos.attach(io: file, filename: 'venturi-2.jpg', content_type: 'image/png')
file = URI.open('https://cdn.usarestaurants.info/assets/uploads/f5d70eb642fcc334923ac860c95dcf5e_-united-states-indiana-elkhart-county-elkhart-township-goshen-venturi-574-485-2985htm.jpg')
@place4.photos.attach(io: file, filename: 'venturi-3.jpg', content_type: 'image/png')
@place4.user = @user1
@place4.save!

@place5 = Place.new(name: 'Common Spirits', top_genre: 'dance', category: 'Bar', address: '111 E. Lincoln Ave, Goshen Indiana, United States', description: 'Cozy hangout spot with good Soul Music', phone_number: '55 1845 9513')
file = URI.open('https://commonspirits.com/wp-content/uploads/2014/12/IMG_20160520_110210-1.jpg')
@place5.photos.attach(io: file, filename: 'common-spirits-1.jpg', content_type: 'image/png')
file = URI.open('https://commonspirits.com/wp-content/uploads/2014/12/IMG_20160609_133357.jpg')
@place5.photos.attach(io: file, filename: 'common-spirits-2.jpg', content_type: 'image/png')
file = URI.open('https://commonspirits.com/wp-content/uploads/2014/12/IMG_20160520_124533.jpg')
@place5.photos.attach(io: file, filename: 'common-spirits-3.jpg', content_type: 'image/png')
@place5.user = @user1
@place5.save!

@place6 = Place.new(name: 'Constant Spring', top_genre: 'dance', category: 'Bar', address: '219 S. Main St, Goshen Indiana, United States', description: 'Cozy hangout spot with good Soul Music', phone_number: '55 1845 9513')
file = URI.open('https://bloximages.newyork1.vip.townnews.com/southbendtribune.com/content/tncms/assets/v3/editorial/b/0a/b0a7bbc2-ed8e-5801-b0f4-0c70dd137ced/55e8158422eee.image.jpg?crop=543%2C543%2C128%2C0&resize=1200%2C1200&order=crop%2Cresize')
@place6.photos.attach(io: file, filename: 'constant-spring-1.jpg', content_type: 'image/png')
file = URI.open('https://scontent-ort2-1.xx.fbcdn.net/v/t1.0-9/118215013_10157882671363214_5593952434385893705_o.jpg?_nc_cat=109&_nc_sid=9267fe&_nc_ohc=wHXGktzkN2oAX9lUvtf&_nc_ht=scontent-ort2-1.xx&oh=4473102d5f097f2b3fc712bc96cad635&oe=5F75DC60')
@place6.photos.attach(io: file, filename: 'constant-spring-2.jpg', content_type: 'image/png')
file = URI.open('https://scontent-ort2-1.xx.fbcdn.net/v/t1.0-9/103256447_10157663196388214_7798530207763132223_o.jpg?_nc_cat=111&_nc_sid=730e14&_nc_ohc=pVldq05eMpwAX_G0UIs&_nc_ht=scontent-ort2-1.xx&oh=b7c8eca4a32ca5affcd32beeb08b37de&oe=5F75D11F')
@place6.photos.attach(io: file, filename: 'constant-spring-3.jpg', content_type: 'image/png')
@place6.user = @user1
@place6.save!

@place7 = Place.new(name: 'Goshen Brewing Company', top_genre: 'jazz', category: 'Restaurant', address: '315 W. Washington St.,Goshen, Indiana, United States', description: 'Cozy hangout spot with good Soul Music', phone_number: '55 1845 9513')
file = URI.open('https://goshenbrewing.com/wp-content/uploads/2015/05/1080-goshen-brewing-8.jpg')
@place7.photos.attach(io: file, filename: 'goshen-brewing-1.jpg', content_type: 'image/png')
file = URI.open('https://scontent-ort2-1.xx.fbcdn.net/v/t1.0-0/c34.0.206.206a/p206x206/105654352_1886314034865335_848628426071560408_o.jpg?_nc_cat=110&_nc_sid=110474&_nc_ohc=7YC2aMavQfQAX-XvjjP&_nc_ht=scontent-ort2-1.xx&oh=5296af7bdc7492fb3fa0f549dd247f70&oe=5F771FE5')
@place7.photos.attach(io: file, filename: 'goshen-brewing-2.jpg', content_type: 'image/png')
file = URI.open('https://scontent-ort2-1.xx.fbcdn.net/v/t1.0-0/c32.0.206.206a/p206x206/89924300_759033684238_1481289376636862464_n.jpg?_nc_cat=107&_nc_sid=de0e5b&_nc_ohc=SV8rd_reYOwAX_B7RgL&_nc_ht=scontent-ort2-1.xx&oh=e8456e31cb3313ab16eb1bc11c48e40d&oe=5F7571FD')
@place7.photos.attach(io: file, filename: 'goshen-brewing-3.jpg', content_type: 'image/png')
@place7.user = @user1
@place7.save!

@place8 = Place.new(name: 'The Electric Brew', top_genre: 'soul', category: 'Restaurant', address: '118 E. Washington St, Goshen, IN, USA', description: 'Mostly jazz, ambient, acoustic, and indie-rock played here, with a cozy vibe.', phone_number: '(574) 555-0911')
file = URI.open('https://lh5.googleusercontent.com/p/AF1QipMxOWat0FjGXxAd8FBWyHgRd2IECqEtVPPlCSF0=w600-h485-p-k-no')
@place8.photos.attach(io: file, filename: 'electricbrew.png', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1578499026171-a1016496b7f5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60')
@place8.photos.attach(io: file, filename: 'coffeeshop.png', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1521017432531-fbd92d768814?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60')
@place8.photos.attach(io: file, filename: 'coffeeambiance.png', content_type: 'image/png')
@place8.user = @user2
@place8.save!

@eat = Place.new(name: 'Eat', top_genre: 'soul', category: 'Restaurant', address: '127 E. Washington St, Goshen, IN, USA', description: 'Mostly jazz, soul, acoustic, and indie-rock played here, with a cozy vibe.', phone_number: '(574) 555-0911')
file = URI.open('https://images.unsplash.com/photo-1527224538127-2104bb71c51b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=751&q=80')
@eat.photos.attach(io: file, filename: 'eat.png', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1578499026171-a1016496b7f5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60')
@eat.photos.attach(io: file, filename: 'coffeeshop.png', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1521017432531-fbd92d768814?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60')
@eat.photos.attach(io: file, filename: 'coffeeambiance.png', content_type: 'image/png')
@eat.user = @user2
@eat.save!

@maple = Place.new(name: 'Maple Indian Cuisine', top_genre: 'art pop', category: 'Restaurant', address: '127 S. Main St, Goshen, IN, USA', description: 'Lots of indie pop, world music, and art pop played here, with delicious food.', phone_number: '(574) 555-0911')
file = URI.open('https://images.unsplash.com/photo-1536305030588-45dc07a2a372?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60')
@maple.photos.attach(io: file, filename: 'indianfood.png', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1582228096960-7f5d2ec4aa8e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60')
@maple.photos.attach(io: file, filename: 'coffeeshop.png', content_type: 'image/png')
@maple.user = @user2
@maple.save!

@phoking = Place.new(name: 'Pho Noodlicious', top_genre: 'classical', category: 'Restaurant', address: '1407 College Ave, Goshen, IN, USA', description: 'Mostly classical music, but also occassionally art pop, kpop, and world music here. Great Pho and spring rolls too!', phone_number: '(574) 555-0911')
file = URI.open('https://images.unsplash.com/photo-1512200937580-db88be2072a4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60')
@phoking.photos.attach(io: file, filename: 'phoking.png', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1596016764780-a5fdbe817fbe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60')
@phoking.photos.attach(io: file, filename: 'phoking2.png', content_type: 'image/png')
@phoking.user = @user2
@phoking.save!

@elephantbar = Place.new(name: 'Elephant Bar', top_genre: 'art pop', category: 'bar', address: '227 S. Main, Goshen, IN, USA', description: 'Mostly art pop, kpop, and world music, great Pho too! Pho King rocks!', phone_number: '(574) 555-0911')
file = URI.open('https://images.unsplash.com/photo-1512200937580-db88be2072a4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60')
@elephantbar.photos.attach(io: file, filename: 'phoking.png', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1596016764780-a5fdbe817fbe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60')
@elephantbar.photos.attach(io: file, filename: 'phoking2.png', content_type: 'image/png')
@elephantbar.user = @user2
@elephantbar.save!

puts "Finished!"

puts "Creating 7 CDMX places!"
@place2 = Place.new(name: 'Gin Gin', top_genre: 'rock', category: 'Bar', address: 'Granada, Miguel Hidalgo, 11529 Ciudad de México, CDMX, Mexico', description: 'Great rock music! The bar specializes in gin cocktails', phone_number: '55 5248 0911')
file = URI.open('https://gingin.mx/repository/imagenes/siteUbicacion/3/_MG_6749.jpg')
@place2.photos.attach(io: file, filename: 'g1.png', content_type: 'image/png')
file = URI.open('https://fastly.4sqi.net/img/general/200x200/156020961_g4F844ile81RCR0bOrOnAHYuMI10UBmLmORCglDoxqM.jpg')
@place2.photos.attach(io: file, filename: 'g2.png', content_type: 'image/png')
file = URI.open('https://i.ytimg.com/vi/wLgb5L84uiI/maxresdefault.jpg')
@place2.photos.attach(io: file, filename: 'g3.png', content_type: 'image/png')
@place2.user = @user1
@place2.save!

@place3 = Place.new(name: 'La Bodega', top_genre: 'jazz', category: 'Restaurant', address: 'Miguel Hidalgo, 11800 CDMX, Mexico', url: 'https://www.labodega.rest/', description: 'Mexican Restaurant with traditional music', phone_number: '55 5511 7390')
file = URI.open('https://www.labodega.rest/images/galeria/1/1.jpg')
@place3.photos.attach(io: file, filename: 'labodega.jpg', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/flagged/photo-1579941429125-4be1ab232711?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60')
@place3.photos.attach(io: file, filename: 'labodega2.jpg', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1589769105893-3cfe4c0c8851?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60')
@place3.photos.attach(io: file, filename: 'labodega3.jpg', content_type: 'image/png')
@place3.user = @user2
@place3.save!

@place11 = Place.new(name: 'Solis', top_genre: 'jazz', category: 'Restaurant', address: 'Condesa, Mexico City', description: 'Cozy hangout spot with good jazz music', phone_number: '55 1845 9513')
file = URI.open('https://images.unsplash.com/photo-1514933651103-005eec06c04b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
@place11.photos.attach(io: file, filename: 'brownbar.jpg', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1485872299829-c673f5194813?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
@place11.photos.attach(io: file, filename: 'cocktailslaughing.jpg', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1577099636826-7a532667d518?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
@place11.photos.attach(io: file, filename: 'soul3.jpg', content_type: 'image/png')
@place11.user = @user2
@place11.save!

@place9 = Place.new(name: 'Los Primos', top_genre: 'latin', category: 'Bar', address: '123 S. 3rd St., Goshen, IN, USA', description: 'Great spot with awesome latin/rock music! Lalo Cura forever!!', phone_number: '55 1847 9513')
file = URI.open('https://images.unsplash.com/photo-1570936100858-56eb3a5f5ae1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
@place9.photos.attach(io: file, filename: 'rockbar1.jpg', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1565755713428-1bdfaa7db8ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
@place9.photos.attach(io: file, filename: 'rockbar2.jpg', content_type: 'image/png')
file = URI.open('https://commonspirits.com/wp-content/uploads/2014/12/IMG_20160520_124533.jpg')
@place9.photos.attach(io: file, filename: 'common-spirits-3.jpg', content_type: 'image/png')
@place9.user = @user2
@place9.save!

@place10 = Place.new(name: "Limon", top_genre: 'rock', category: 'bar', address: 'Roma Sur, Cuauhtémoc, 06760 Ciudad de México, CDMX, Mexico', description: 'Fun hangout spot with good rock music and shufffleboard!', phone_number: '55 1897 9513')
file = URI.open('https://images.unsplash.com/photo-1530119412657-4f6cd87aad79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
@place10.photos.attach(io: file, filename: 'limon1.jpg', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1554917134-21e9f7431d08?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
@place10.photos.attach(io: file, filename: 'limon2.jpg', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1553194588-6ba2cd5b410f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
@place10.photos.attach(io: file, filename: 'limon3.jpg', content_type: 'image/png')
@place10.user = @user2
@place10.save!

@place12 = Place.new(name: 'Cafe Discoteq', top_genre: 'rock', category: 'Nightclub', address: 'Hipódromo Condesa, Cuauhtémoc, 06170 Ciudad de México, CDMX, Mexico', description: 'Hard rock cafe, not like those other posers', phone_number: '55 1845 9513')
file = URI.open('https://images.unsplash.com/photo-1566737236500-c8ac43014a67?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
@place12.photos.attach(io: file, filename: 'cafediscoteq1.jpg', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1516460541734-4d739711d218?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
@place12.photos.attach(io: file, filename: 'cafediscoteq2.jpg', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1569924995012-c4c706bfcd51?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
@place12.photos.attach(io: file, filename: 'cafediscoteq3.jpg', content_type: 'image/png')
@place12.user = @user2
@place12.save!

@place13 = Place.new(name: "Frida's", top_genre: 'rock', category: 'Nightclub', address: 'Del Carmen, Coyoacán, 04100 Ciudad de México, CDMX, Mexico', description: "Mostly rock music with latin flavors played here, a fun vibe Frida would've loved.", phone_number: '(574) 555-0911')
file = URI.open('https://images.unsplash.com/photo-1453614512568-c4024d13c247?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
@place13.photos.attach(io: file, filename: 'fridas.png', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1578499026171-a1016496b7f5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60')
@place13.photos.attach(io: file, filename: 'coffeeshop.png', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1521017432531-fbd92d768814?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60')
@place13.photos.attach(io: file, filename: 'coffeeambiance.png', content_type: 'image/png')
@place13.user = @user2
@place13.save!

@dino = Place.new(name: "Dinosaur", top_genre: 'rock', category: 'Nightclub', address: 'Del Carmen, Coyoacán, 04100 Ciudad de México, CDMX, Mexico', description: "Classic rock with a stone age twist!", phone_number: '(574) 555-0911')
file = URI.open('https://images.unsplash.com/photo-1565789279225-6cf30f169070?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
@dino.photos.attach(io: file, filename: 'dino1.png', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1552566626-2d907dab0dff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
@dino.photos.attach(io: file, filename: 'dino2.png', content_type: 'image/png')
file = URI.open('https://images.unsplash.com/photo-1521017432531-fbd92d768814?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60')
@dino.photos.attach(io: file, filename: 'coffeeambiance.png', content_type: 'image/png')
@dino.user = @user2
@dino.save!

puts "Finished!"

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
@review10 = Review.new(content: 'Fantastic latin beats, always gets my feet moving while enjoying stellar gorditas! YUM!', rating: 5)
@review10.user = @user1
@review10.place = @place9
@review10.save!
genre_review10 = GenresReview.new
genre_review10.review = @review10
genre_review10.genre = Genre.find_by(name: 'latin')
genre_review10.save

@review11 = Review.new(content: 'Love these rhythms! Everything from fast Puerto Rican salsa to harmonic banda, and often some local latin rock too!', rating: 4)
@review11.user = @user2
@review11.place = @place9
@review11.save!
genre_review11 = GenresReview.new
genre_review11.review = @review11
genre_review11.genre = Genre.find_by(name: 'latin')
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

puts 'creating reviews for first 6 cdmx jazz places'

@review20 = Review.new(content: "Has an amazing vibe! The music selection was on point!", rating: 5)
@review20.user = @user2
@review20.place = @parkerlenox
@review20.save!
genre_review20 = GenresReview.new
genre_review20.review = @review20
genre_review20.genre = Genre.find_by(name: "jazz")
genre_review20.save

@review21 = Review.new(content: "WOW! Just WOW! This place is a hidden gem, amazing live performance. Will definitely be back!", rating: 5)
@review21.user = @user2
@review21.place = @zinco
@review21.save!
genre_review21 = GenresReview.new
genre_review21.review = @review21
genre_review21.genre = Genre.find_by(name: "jazz")
genre_review21.save

@review22 = Review.new(content: "Pretty cool place with live performances, a little bit small though. Pizza is also mediocre", rating: 3)
@review22.user = @user1
@review22.place = @pizzajazz
@review22.save!
genre_review22 = GenresReview.new
genre_review22.review = @review22
genre_review22.genre = Genre.find_by(name: "jazz")
genre_review22.save

@review23 = Review.new(content: "Really good music selection! The vibe here is great.", rating: 4)
@review23.user = @user1
@review23.place = @casafranca
@review23.save!
genre_review23 = GenresReview.new
genre_review23.review = @review23
genre_review23.genre = Genre.find_by(name: "jazz")
genre_review23.save

@review24 = Review.new(content: "This restaurant has 'Jazz on Wheels' where there are live performances. Awesome!", rating: 5)
@review24.user = @user1
@review24.place = @elconvite
@review24.save!
genre_review24 = GenresReview.new
genre_review24.review = @review24
genre_review24.genre = Genre.find_by(name: "jazz")
genre_review24.save

puts 'finished!'

puts 'Creating Goshen Reviews'

@review25 = Review.new(content: "This restaurant is pretty cool, decent music, decent wings", rating: 4)
@review25.user = @user2
@review25.place = @elconvite
@review25.save!
genre_review25 = GenresReview.new
genre_review25.review = @review25
genre_review25.genre = Genre.find_by(name: "art pop")
genre_review25.save

@review26 = Review.new(content: "Such an awesome place with live music! Also a record store!!!", rating: 5)
@review26.user = @user1
@review26.place = @elconvite
@review26.save!
genre_review26 = GenresReview.new
genre_review26.review = @review26
genre_review26.genre = Genre.find_by(name: "art pop")
genre_review26.save

puts 'finished'

puts 'creating reviews for 6 cdmx rock places and 1 jazz'

@review27 = Review.new(content: "This is a very cool bar! Definitely recommend!", rating: 5)
@review27.user = @user1
@review27.place = @sixtiesbar
@review27.save!
genre_review27 = GenresReview.new
genre_review27.review = @review27
genre_review27.genre = Genre.find_by(name: "rock")
genre_review27.save

@review28 = Review.new(content: "Amazing! Just Amazing! Awesome vibe", rating: 5)
@review28.user = @user1
@review28.place = @bebop
@review28.save!
genre_review28 = GenresReview.new
genre_review28.review = @review28
genre_review28.genre = Genre.find_by(name: "rock")
genre_review28.save

@review29 = Review.new(content: "I had a blast here!!!", rating: 5)
@review29.user = @user2
@review29.place = @gatocalavera
@review29.save!
genre_review29 = GenresReview.new
genre_review29.review = @review29
genre_review29.genre = Genre.find_by(name: "rock")
genre_review29.save

@review30 = Review.new(content: "One of the best places for live music in CDMX!", rating: 5)
@review30.user = @user2
@review30.place = @rockson
@review30.save!
genre_review30 = GenresReview.new
genre_review30.review = @review30
genre_review30.genre = Genre.find_by(name: "rock")
genre_review30.save

@review31 = Review.new(content: "Very chill place. Will definitely come back", rating: 4)
@review31.user = @user1
@review31.place = @bizarrocafe
@review31.save!
genre_review31 = GenresReview.new
genre_review31.review = @review31
genre_review31.genre = Genre.find_by(name: "rock")
genre_review31.save

@review32 = Review.new(content: "Decent music", rating: 3)
@review32.user = @user2
@review32.place = @valiant
@review32.save!
genre_review32 = GenresReview.new
genre_review32.review = @review32
genre_review32.genre = Genre.find_by(name: "rock")
genre_review32.save

@review33 = Review.new(content: "Such an amazing vibe! Highly recommend!", rating: 5)
@review33.user = @user1
@review33.place = @turkana
@review33.save!
genre_review33 = GenresReview.new
genre_review33.review = @review33
genre_review33.genre = Genre.find_by(name: "jazz")
genre_review33.save

puts 'finished'