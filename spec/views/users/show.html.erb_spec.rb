require 'rails_helper'
include RandomData
include SessionsHelper

RSpec.describe "users/show.html.erb", type: :view do

  let(:user) { create(:user) }
  #let(:topic) { create(:topic) }
  #let(:post) { create(:post, topic: topic, user: user) }
  #let(:vote) { Vote.create!(value: 1) }

  describe "check favorites are listed" do

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

end
