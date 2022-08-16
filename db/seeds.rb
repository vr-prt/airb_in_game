puts "Deleting all the models..."
GameWorld.destroy_all
User.destroy_all

User.create(username: "adminofapp", email: "a@a.a", password: "abc1234")

20.times do
  user = User.create(
    username: Faker::Internet.username(specifier: 10),
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )

  puts "Successfully created #{user.username} with #{user.email}"

  game_world = GameWorld.new(
    name: Faker::Game.title,
    description: Faker::Quote.yoda
  )

  game_world.user = user
  game_world.save!

  puts "Successfully created #{game_world.name} associated to #{user.username}"
end

puts 'All done!'
