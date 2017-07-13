module PostsHelper
  #Verifies if the current user is admin
  def is_admin()
    if current_user
      current_user.is_admin
    end
  end

  #Gets a gravatar image
  def gravatar_for(user, size: 80)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.email, class: "gravatar img-circle")
  end

  def render_with_hashtags(content)
      content.gsub(/#\w+/){|word| link_to word, "/posts/hashtag/#{word.downcase.delete('#')}"}.html_safe
  end

end
