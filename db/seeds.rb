# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'random_data'

# Create Users
 5.times do
   User.create!(
 # #3
   name:     RandomData.random_name,
   email:    RandomData.random_email,
   password: RandomData.random_sentence
   )
 end
 users = User.all

15.times do
     Topic.create!(
          name: RandomData.random_sentence,
          description: RandomData.random_paragraph
     )
end
topics = Topic.all

50.times do

    Post.create!(
        user:   users.sample,
        topic: topics.sample,
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
    )

    SponsoredPost.create!(
         topic: topics.sample,
         title: RandomData.random_sentence,
         body: RandomData.random_paragraph,
         price: rand(50)
    )

  ##  Advertisement.create!(
        ##title: RandomData.random_sentence,
        ##body: RandomData.random_paragraph,
        ##price: rand(50)
   ##)

    Question.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        resolved: [true, false].sample
    )
end
post = Post.all
question = Question.all

100.times do
    Comment.create!(
        user: users.sample,
        post: post.sample,
        body: RandomData.random_paragraph
    )

    Answer.create!(
         question: question.sample,
         body: RandomData.random_paragraph
    )
end

# Create an admin user
 admin = User.create!(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )

 # Create a member
 member = User.create!(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld'
 )

 moderator = User.create!(
  name:     'Moderator User',
  email:    'moderator@example.com',
  password: 'helloworld',
  role:     'moderator'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} post created"
puts "#{Comment.count} comments created"

##puts "#{Advertisement.count} ads created"
puts "#{SponsoredPost.count} sponsored posts created"
puts "#{Question.count} questions created"
puts "#{Answer.count} answers created"
