class Api::V1::TopicsController < Api::V1::BaseController

  before_action :authenticate_user, except: [:index, :show]
  before_action :authorize_user, except: [:index, :show]

  def index
    topics = Topic.all
    render json: topics.to_json, status: 200
  end

  def show
    topic = Topic.find(params[:id])
    posts = Post.find(topic.id)
    # why is the topic header not appearing in the json output,
    # posts is present with the following "posts":[....]
    respond_to do |format|
      format.json  { render json: topic.to_json(include: [:posts])}
    end
    # Test call above is curl -H "Authorization: Token 3FqGRrMfvJzUqZTZCwbYubp4c4l99c4rNzqsczhw6Di+ZroPlMlJrP8Iy9zJXCG/QCSJY7b4eKpVB16TAmLNgA==" http://localhost:3000/api/v1/topics/1  


  end


#### end class
end
