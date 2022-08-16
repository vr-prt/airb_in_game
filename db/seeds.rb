puts "Creating 20 fake users..."

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

# puts "20 fake users created successfully"

# puts "Creating 10 Game Worlds"

# puts "20 fake game worlds created successfully"

# puts "Seeds finished! Goodbye"
