class FavoriteMailer < ApplicationMailer
  default from: "daniels111@gmail.com"

  def new_comment(user, post, comment)

    headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
    headers["References"] = "<post/#{post.id}@your-app-name.example>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end

  def new_post(user, post, topic)

    headers["Message-ID"] = "<post/#{post.id}@bloccit.com>"
    headers["In-Reply-To"] = "<post/#{user.id}@bloccit.com>"
    headers["References"] = "<post/#{post.id}@bloccit.com>"

    @user = user
    @post = post
    @topic = topic

    mail(to: user.email, subject: "New post on #{@topic.name}")
  end


end
