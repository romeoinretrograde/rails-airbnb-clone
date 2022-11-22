require "open-uri"

puts "Cleaning the DB"

Pig.destroy_all
User.destroy_all

puts "creating owner of pigs"

owner = User.create(email: "pig@master.com", password: "123456")
pig_photos = [
  
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
