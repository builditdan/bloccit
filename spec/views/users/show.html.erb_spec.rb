require 'rails_helper'
include RandomData
include SessionsHelper

RSpec.describe "users/show.html.erb", type: :view do

  let(:user) { create(:user) }
  let(:topic) { create(:topic) }
  let(:post) { Post.create!(title: "My Title from rspec", body: RandomData.random_paragraph, topic_id: 1, user_id: user.id) }
  let(:fav) { Favorite.create!(user_id: user.id, post_id: post.id)}
  let(:com) { Comment.create!(body:RandomData.random_paragraph, post_id: post.id, user_id: user.id)}


 describe "check favorites, comments, posts are not listed" do

    #let(:user) { create(:user) }

    before do
      create_session(user)
    end

    it "checks for no posts" do
      assign(:user, user)
      render
      expect(rendered).to include ("any posts yet")
    end

    it "checks for no comments" do
      assign(:user, user)
      render
      expect(rendered).to include ("any comments yet")
    end

    it "checks for no favorited posts" do
      assign(:user, user)
      render
      expect(rendered).to include ("any favorited posts yet")
    end

  end

  describe "check favorites, comments, posts are listed" do

    before do
      assign(:user, user)
      assign(:topic, topic)
      assign(:post, post)
      assign(:fav, fav)
      assign(:com, com)
      create_session(user)
    end

    it "checks for no posts" do
        render
      expect(rendered).not_to include ("any posts yet")
    end

    it "checks for no comments" do
      render
      expect(rendered).not_to include ("any comments yet")
    end

    it "checks for no favorited posts" do
      render
      expect(rendered).not_to include ("any favorited posts yet")
    end

  end


end
