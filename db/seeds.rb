puts "Deleting all the models..."
Reservation.destroy_all
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

  reservation = Reservation.new(
    start_date: Faker::Date.between(from: '2014-07-23', to: '2014-09-25'),
    end_date: Faker::Date.between(from: 9.days.ago, to: Date.today)
  )

  reservation.user = user
  reservation.game_world = game_world

  reservation.save!

  puts "Successfully created #{game_world.name} associated to #{user.username}"
  puts "Successfully created reservation from #{user.username} for #{game_world.name} world with id: #{reservation.id}"
  puts "Last reservation start date: #{reservation.start_date}, end date #{reservation.end_date}"
end

puts 'All done!'
