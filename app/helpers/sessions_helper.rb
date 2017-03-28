module SessionsHelper

  def create_session(user)
    session[:user_id] = user.id
  end

  def destroy_session(user)
    session[:user_id] = nil
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def post_author_pic(post)
    author = User.find_by(id: post[:user_id])
    return author.avatar_url(22)
  end
end
