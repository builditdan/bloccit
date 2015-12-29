#let(:comment) { Comment.create!(body: 'Comment Body',
#   post: post, user: user)}
include RandomData

 FactoryGirl.define do
   factory :comment do
     body 'Comment Body'
     post
     user
   end
 end
