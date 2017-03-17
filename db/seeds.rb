require 'random_data'

 # Create Posts
 50.times do
   Post.create!(

     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all

 # Create Comments

 100.times do
   Comment.create!(
 # #4
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end

 Post.find_or_create_by!(title: "I know kung fu!", body: "And I can see the matrix now.")
 Comment.find_or_create_by(post: 101, body: "Whoa...")

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
