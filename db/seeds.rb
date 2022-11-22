require "open-uri"

puts "Cleaning the DB"

Pig.destroy_all
User.destroy_all

puts "creating owner of pigs"

owner = User.create(email: "pig@master.com", password: "123456")
pig_photos = [
  "https://2.bp.blogspot.com/-YmNpgMZE9Aw/T9xGjf6FcgI/AAAAAAAACW0/Iww9y7iWjSg/s1600/Pig+image.jpg",
  "https://humanepro.org/sites/default/files/styles/article_new/public/images/hero/magazine-2019-summer-this-little-piggy-cover.jpg?itok=RClat6WE",
  "https://i.pinimg.com/originals/02/cb/ce/02cbce24a2391caf364d13e46aedf605.jpg",
  "https://i.pinimg.com/736x/50/70/03/507003c6f99d6473549a0b5e363ca476.jpg",
  "https://www.lushome.com/wp-content/uploads/2010/03/pets-miniature-pigs-16.jpg",
  "https://external-preview.redd.it/n4r8kauF7dbaxAi-n9UG2YvuMQt08iU-szwUJ1yutKY.jpg?auto=webp&s=8a4e71e3941ba848f156de640042f308d1a6f32b",
  "https://organicfeeds.com/wp-content/uploads/2020/10/Average-Mini-Pig-Weights-Sizes-by-Age-1200x800.jpg",
  "mini-pig-in-dog-bed-e1640105809317.jpg",
  "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.motherearthnews.com%2Fhomesteading-and-livestock%2Fthe-truth-about-mini-pigs-zbcz1807%2F&psig=AOvVaw2HiWp4yqOI4xqK9JvdjDyl&ust=1669198781182000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJC7t6_IwfsCFQAAAAAdAAAAABB5",
  "https://i0.wp.com/lifewithaminipig.com/wp-content/uploads/2015/07/DSCN1585.jpg"
]

puts "generating new pigs"

10.times do |i|
  file = URI.open(pig_photos[i-1])
  pig = Pig.new(name: Faker::Creature::Dog.name, age: rand(1..10), details: Faker::Lorem.sentence, breed: ["Pot Bellied", "Miniature", "Kune Kune"].sample, user: owner)
  pig.photo.attach(io: file, filename: "piggy-#{i}", content_type: "image/png")
  pig.save
end

puts "Finished"
