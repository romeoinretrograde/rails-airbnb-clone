puts "Cleaning the DB"

Pig.destroy_all
User.destroy_all

puts "creating owner of pigs"

owner = User.create(email: "pig@master.com", password: "123456")

puts "generating new pigs"

20.times do

  Pig.create(name: Faker::Creature::Dog.name, age: rand(1..10), details: Faker::Lorem.sentence, breed: ["Pot Bellied", "Miniature", "Kune Kune"].sample, user: owner)
end

puts "Finished"
