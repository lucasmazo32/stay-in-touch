# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'Database to be created'

10.times do |n|
  name  = Faker::Name.name
  email = "foo#{n+1}@bar.com"
  password = "foobar"
  image = Faker::Avatar.image
  User.create!(name:  name,
               gravatar_url: image,
               email: email,
               password:              password,
               password_confirmation: password)
end

p ' Users successfully created'

10.times do
  a = Faker::Number.within(range: 1..10)
  b = Faker::Number.within(range: 1..10)
  s = Faker::Boolean.boolean(true_ratio: 1.0)
  Friendship.create!(friend_id: a, friended_id:b, status:s)
end

p 'Friendships have been created'
p 'Completed Successfuly'