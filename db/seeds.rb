include RandomData

50.times do
  Post.create!(
  title: RandomData.random_sentence,
  body: RandomData.random_paragraph
  )

end

posts = Post.all

100.times do
  Comment.create!(
  post: posts.sample,
  body: RandomData.random_paragraph
  )
end

Post.create!(title: 'Dan1', body: 'Dan1 body.')
Post.create!(title: 'Dan1', body: 'Dan1 body.')
Post.create!(title: 'Dan1', body: 'Dan1 body.')
Post.find_or_create_by!(title: 'Dans post on Reddit!', body: 'This is my very first post on Reddit. Is is important to point out that it is unique.')
Comment.find_or_create_by!(body: 'Dans comment on Reddit for my first post!')

# puts post_record.persisted?
# puts post_record.new_record?
# puts post_record.methods

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
