require "open-uri"

puts "Cleaning the DB"

Pig.destroy_all
User.destroy_all

puts "creating owner of pigs"

owner = User.create(email: "pig@master.com", password: "123456")
pig_photos = ["https://res.cloudinary.com/dnk27mzjg/image/upload/v1669139361/pig5_bif6qs.jpg",
  "https://res.cloudinary.com/dnk27mzjg/image/upload/v1669139361/pig3_jlp9hg.jpg",
  "https://res.cloudinary.com/dnk27mzjg/image/upload/v1669139361/pig4_lptps1.jpg",
  "https://res.cloudinary.com/dnk27mzjg/image/upload/v1669139360/pig2_w6dkt9.jpg",
  "https://res.cloudinary.com/dnk27mzjg/image/upload/v1669139360/pig1_yjma7v.jpg",
  "https://res.cloudinary.com/dnk27mzjg/image/upload/v1669139359/pig17_hzm3qd.png",
  "https://res.cloudinary.com/dnk27mzjg/image/upload/v1669139360/pig19_m2z0sc.jpg",
  "https://res.cloudinary.com/dnk27mzjg/image/upload/v1669139360/pig16_rvyprf.png",
  "https://res.cloudinary.com/dnk27mzjg/image/upload/v1669139360/pig12_aipaw9.png",
  "https://res.cloudinary.com/dnk27mzjg/image/upload/v1669139360/pig18_yuwscs.jpg"
]

puts "generating new pigs"

10.times do |i|
  file = URI.open(pig_photos[i-1])
  pig = Pig.new(name: Faker::Creature::Dog.name, age: rand(1..10), details: Faker::Lorem.sentence, breed: ["Pot Bellied", "Miniature", "Kune Kune"].sample, user: owner)
  pig.photo.attach(io: file, filename: "piggy-#{i}", content_type: "image/png")
  puts pig.name
  pig.save
end

puts "Finished"
