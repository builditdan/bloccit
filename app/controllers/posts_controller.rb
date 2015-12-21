class PostsController < ApplicationController

  before_action :require_sign_in, except: :show
  before_action :authorize_user, except: [:show, :new, :create]
#  before_action :authorize_moderator, except: [:show, :new,]

  def show
    @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(post_params)
    @post.user = current_user

    @post.topic = @topic

    if @post.save
      @post.labels = Label.update_labels(params[:post][:labels])
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end

  end

  def update
    @post = Post.find(params[:id])
    @post.assign_attributes(post_params)

    if @post.save
      @post.labels = Label.update_labels(params[:post][:labels])
      flash[:notice] = "Post was updated."
      redirect_to [@post.topic, @post]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
      redirect_to @post.topic
    else
      flash.now[:alert] = "There was an error deleteing the post."
      render :show
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end

    def authorize_user
    #  if !current_user.moderator?
        post = Post.find(params[:id])
        unless current_user == post.user || current_user.admin? || current_user.moderator?
          # flash.now not working in my code so using just flash
          #flash.now[:alert] = "You must be an admin to do that."
          flash[:alert] = "You must be an admin to do that."
          redirect_to [post.topic, post]
        end
    #  end
    end

    def authorize_moderator
      if current_user.moderator?
        topic = Topic.find(params[:topic_id])
        unless current_user.admin? || user_moderator_authorized?
          # flash.now not working in my code so using just flash
          #flash.now[:alert] = "You must be an admin to do that."
          flash[:alert] = "You must be an admin to do that."
          redirect_to [topic]
        end
      end
    end

    def user_moderator_authorized?
      #false
      if current_user.moderator? && params[:action] == "destroy"
        false
    #  elsif current_user.moderator? && params[:action] == "new"
    #   false
      elsif current_user.moderator? && params[:action] == "create"
        false
      elsif current_user.moderator?
        true
    end

    end


#### end class
end
