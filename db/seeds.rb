puts "Deleting all the models..."
Reservation.destroy_all
GameWorld.destroy_all
User.destroy_all
puts "All the data deleted"
puts '--------------------------------'

puts "Creating the main user..."
main_user = User.create(username: "airbingame", email: "a@a.a", password: "abc1234")
puts "Main user #{main_user.username} created"

main_game_worlds = [
  GameWorld.new(
    name: 'Super Mario Sunshine',
    description: 'Visit the tropical Isle Delfino, where Mario, Toadsworth, Princess Peach, and five Toads are taking a vacation.'
  ),
  GameWorld.new(
    name: 'Pokemon Sword',
    description: 'Become the Pokemon Champion, this time in the new Galar region, which is based on the United Kingdom.'
  ),
  GameWorld.new(
    name: 'The Legend of Zelda: Ocarina of Time',
    description: 'Journey through the land of Hyrule, navigate dungeons and an overworld.'
  )
]

main_game_worlds.each do |game_world|
  game_world.user = main_user
  game_world.save!
end

reservation1 = Reservation.new(
  start_date: Date.new(2022, 8, 23),
  end_date: Date.new(2022, 8, 27),
  status: 1
)
reservation1.game_world = GameWorld.find_by(name: 'Super Mario Sunshine')
reservation1.user = main_user
reservation1.save!
puts "Successfully created reservation linked to #{reservation1.game_world.name}"

reservation2 = Reservation.new(
  start_date: Date.new(2022, 9, 1),
  end_date: Date.new(2022, 9, 8)
)
reservation2.game_world = GameWorld.find_by(name: 'Pokémon Sword')
reservation2.user = main_user
reservation2.save!
puts "Successfully created reservation linked to #{reservation2.game_world.name}"

reservation3 = Reservation.new(
  start_date: Date.new(2022, 8, 5),
  end_date: Date.new(2022, 8, 8),
  status: 2
)
reservation3.game_world = GameWorld.find_by(name: 'The Legend of Zelda: Ocarina of Time')
reservation3.user = main_user
reservation3.save!
puts "Successfully created reservation linked to #{reservation3.game_world.name}"

puts 'Main data successfully added'
puts '--------------------------------'

puts 'Generating random users, game worlds and reservations...'
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

  reservation = Reservation.new(
    start_date: Faker::Date.between(from: '2022-07-23', to: '2022-09-25'),
    end_date: Faker::Date.between(from: '2022-09-26', to: '2022-10-12')
  )

  reservation.user = user
  reservation.game_world = game_world

  reservation.save!

  puts "Successfully created #{game_world.name} associated to #{user.username}"
  puts "Successfully created reservation from #{user.username} for #{game_world.name} world with id: #{reservation.id}"
  puts "Last reservation start date: #{reservation.start_date}, end date #{reservation.end_date}"
end

puts 'All done!'
