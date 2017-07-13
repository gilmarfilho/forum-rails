module UsersHelper
  #Verifies if the current user is admin
  def is_admin()
    if current_user
      current_user.is_admin
    end
  end
  def is_Man()
    if current_user
      current_user.sex
    end
  end
  #Gets a gravatar image
  def gravatar_for(user, size: 80)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.email, class: "gravatar")
  end
end
