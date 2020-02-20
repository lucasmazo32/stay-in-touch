# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'Database to be created'

20.times do |n|
  name = Faker::Name.first_name + ' ' + Faker::Name.last_name
  email = "foo#{n+1}@bar.com"
  password = "foobar"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
p 'Users successfully created'

20.times do
  user = Faker::Number.within(range: 1..20)
  quote = Faker::Quote.matz 
  Post.create!(user_id: user,
               content: quote)
end

p 'Posts successfully created'

40.times do
  post = Faker::Number.within(range: 1..20)
  user = Faker::Number.within(range: 1..20)
  content = Faker::Quote.most_interesting_man_in_the_world 
  Comment.create!(post_id: post,
                  user_id: user,
                  content: content
  )
end

p 'Comments successfully created'

Friendship.create!(friend_id: 1, friended_id: 2, status: Faker::Boolean.boolean)
Friendship.create!(friend_id: 1, friended_id: 4, status: Faker::Boolean.boolean)
Friendship.create!(friend_id: 1, friended_id: 6, status: Faker::Boolean.boolean)
Friendship.create!(friend_id: 1, friended_id: 8, status: Faker::Boolean.boolean)
Friendship.create!(friend_id: 1, friended_id: 10, status: Faker::Boolean.boolean)
Friendship.create!(friend_id: 3, friended_id: 2, status: Faker::Boolean.boolean)
Friendship.create!(friend_id: 3, friended_id: 4, status: Faker::Boolean.boolean)
Friendship.create!(friend_id: 3, friended_id: 6, status: Faker::Boolean.boolean)
Friendship.create!(friend_id: 3, friended_id: 8, status: Faker::Boolean.boolean)
Friendship.create!(friend_id: 3, friended_id: 10, status: Faker::Boolean.boolean)
Friendship.create!(friend_id: 2, friended_id: 5, status: Faker::Boolean.boolean)
Friendship.create!(friend_id: 2, friended_id: 7, status: Faker::Boolean.boolean)
Friendship.create!(friend_id: 2, friended_id: 9, status: Faker::Boolean.boolean)
Friendship.create!(friend_id: 2, friended_id: 11, status: Faker::Boolean.boolean)
Friendship.create!(friend_id: 2, friended_id: 13, status: Faker::Boolean.boolean)
Friendship.create!(friend_id: 8, friended_id: 9, status: Faker::Boolean.boolean)
Friendship.create!(friend_id: 8, friended_id: 11, status: Faker::Boolean.boolean)
Friendship.create!(friend_id: 8, friended_id: 13, status: Faker::Boolean.boolean)
Friendship.create!(friend_id: 8, friended_id: 15, status: Faker::Boolean.boolean)
Friendship.create!(friend_id: 8, friended_id: 17, status: Faker::Boolean.boolean)
Friendship.create!(friend_id: 10, friended_id: 11, status: Faker::Boolean.boolean)
Friendship.create!(friend_id: 10, friended_id: 13, status: Faker::Boolean.boolean)
Friendship.create!(friend_id: 10, friended_id: 15, status: Faker::Boolean.boolean)
Friendship.create!(friend_id: 10, friended_id: 17, status: Faker::Boolean.boolean)
Friendship.create!(friend_id: 10, friended_id: 19, status: Faker::Boolean.boolean)

p 'Friendships have been created'

10.times do |n|
  post = Faker::Number.within(range: 1..20)
  user = Faker::Number.within(range: 1..20)
  Like.create!(post_id: post,
               user_id: user
  )
end

p 'Likes successfully created'

p 'Completed Successfuly'