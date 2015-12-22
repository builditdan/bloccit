class TopicsController < ApplicationController

before_action :require_sign_in, except: [:index, :show]
before_action :authorize_user, except: [:index, :show]

def index
  @topics = Topic.all
end

def show
  @topic = Topic.find(params[:id])
  @rating = Rating.find(@topic.rating) if @topic.rating != nil
end

def new
  @topic = Topic.new
  @rating = Rating.new
end

def create
  @topic = Topic.new(topic_params)
  @topic.rating = Rating.update_rating(params[:topic][:rating])

  if @topic.save
    @topic.labels = Label.update_labels(params[:topic][:labels])
    redirect_to @topic, notice: "Topic was saved successfully."
  else
    flash.now[:alert] = "error creating topic. Please try again."
    render :new
  end

end

def edit
  @topic = Topic.find(params[:id])
  @rating = Rating.find(@topic.rating) if @topic.rating != nil
end

def update
  @topic = Topic.find(params[:id])
  @topic.assign_attributes(topic_params)
  @topic.rating = Rating.update_rating(params[:topic][:rating])

  if @topic.save
    @topic.labels = Label.update_labels(params[:topic][:labels])
    flash[:notice] = "Topic was updated."
    redirect_to @topic
  else
    flash.now[:alert] = "Error saving topic. Please try again."
    render :edit
  end

end

def destroy
  @topic = Topic.find(params[:id])
  if @topic.destroy
    flash[:notice] = "\"#{@topic.name}\" was deleted successfully."
    redirect_to action: :index
  else
    flash.now[:alert] = "There was an error deleting the topic."
    render :show
  end
end

private

  def topic_params
    params.require(:topic).permit(:name, :description, :public)
  end

  def authorize_user

    unless current_user.admin? || user_moderator_authorized?
      # Can't figure out why flash.now is not working, had to
      # use flash, think only supported with a render ???
      #flash.now[:alert] = "You must be an admin to do that."
      flash[:alert] = "You must be an admin to do that!!"
      redirect_to topics_path
    end

  end

  def user_moderator_authorized?
    #false
    if current_user.moderator? && params[:action] == "destroy"
      false
    elsif current_user.moderator? && params[:action] == "new"
      false
    elsif current_user.moderator? && params[:action] == "create"
      false
    elsif current_user.moderator?
      true
    end

  end

#### class end
end
