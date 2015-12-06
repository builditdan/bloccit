module MyUtilities

  def censor_posts(posts)
      posts.each_with_index do |post,idx|
        post.title = "** SPAM **" if (idx == 0) || ((idx % 5) == 0 )
      end
      posts
  end

end
