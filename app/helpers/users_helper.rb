module UsersHelper
#User.find_by(id: session[:user_id])
  def got_posts
    if Post.find_by(user_id: current_user.id)
      raw "<h2>Posts</h2>"
    else
      raw "<br>" + "#{current_user.name} has not submitted any posts yet"
    end
  end

  def got_comments
    if Comment.find_by(user_id: current_user.id)
      raw "<h2>Comments</h2>"
    else
      raw "<br><br>" + "#{current_user.name} has not submitted any comments yet"
    end
  end

  def got_favorites
    if Favorite.find_by(user_id: current_user.id)
      raw "<h2>Favorited Posts</h2>"
    else
      raw "<br><br>" + "#{current_user.name} has not submitted any favorited posts yet"
    end
  end




end
