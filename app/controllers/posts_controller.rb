include MyUtilities

class PostsController < ApplicationController

  def index
    @posts = Post.all
    @posts = censor_posts(@posts)
  end

  def show
  end

  def new
  end

  def edit
  end



end
