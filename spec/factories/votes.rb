#let(:vote) { Vote.create!(value: 1, post: post, user: user) }

FactoryGirl.define do
  factory :vote do
    value 1
    post
    user
  end
end
