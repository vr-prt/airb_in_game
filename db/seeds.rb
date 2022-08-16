puts "Creating 20 fake users and game worlds..."

20.times do
 user = User.create(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
  )

  game_world = GameWorld.new(
    name: Fake::Game.title,
    description: Faker::Quote.yoda,
   )

  game_world.user = user
  game_world.save!
end

puts "Successfully created and added to the database"
puts "Goodbye!"
