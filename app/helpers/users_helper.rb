module UsersHelper
  def avatar_tag(arg = {})
    avatar_url = current_user.facebook_picture_url || "http://placehold.it/30x30"
    image_tag avatar_url, arg
  end
end
