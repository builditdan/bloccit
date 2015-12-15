module TopicsHelper

  def user_is_authorized_to_edit_topics?
    current_user && (current_user.admin? or current_user.moderator?)
  end

  def user_is_authorized_to_delete_topics?
    current_user && current_user.admin?
  end

end
