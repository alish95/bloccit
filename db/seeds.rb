# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'random_data'

15.times do
     Topic.create!(
          name: RandomData.random_sentence,
          description: RandomData.random_paragraph
     )
end
topics = Topic.all

50.times do

    Post.create!(
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

    Advertisement.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        price: rand(50)
   )

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
        post: post.sample,
        body: RandomData.random_paragraph
    )

    Answer.create!(
         question: question.sample,
         body: RandomData.random_paragraph
    )
end

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Post.count} post created"
puts "#{Comment.count} comments created"

puts "#{Advertisement.count} ads created"
puts "#{SponsoredPost.count} sponsored posts created"
puts "#{Question.count} questions created"
puts "#{Answer.count} answers created"
