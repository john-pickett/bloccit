class FavoriteMailer < ApplicationMailer
  default from: "john.pickett@gmail.com"

  def new_comment(user, post, comment)

    headers["Message-ID"] = "<comments/#{comment.id}@blooming-temple-79725.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@blooming-temple-79725.herokuapp.com>"
    headers["References"] = "<post/#{post.id}@blooming-temple-79725.herokuapp.com"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end

  def new_post(user, post)

    headers["Message-ID"] = "<post/#{post.id}@blooming-temple-79725.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@blooming-temple-79725.herokuapp.com>"
    headers["References"] = "<post/#{post.id}@blooming-temple-79725.herokuapp.com"

    @post = post
    mail(to: user.email, subject: "You've auto-followed #{post.title}")

  end

end
