module ApplicationHelper

  def btn_facebook
     resource_class.omniauth_providers.each do |provider|
       return link_to "Sign in with #{OmniAuth::Utils.camelize(provider)}",
      omniauth_authorize_path(resource_name, provider),
      :class=>"navbar-wagon-item navbar-wagon-button btn"
   end
  end

  def forgot_password
    link_to "Forgot your password?", new_password_path(resource_name), :class=>"navbar-wagon-item navbar-wagon-button btn"
  end

  def sign_up
    link_to "Sign up", new_registration_path(resource_name), :class=>"navbar-wagon-item navbar-wagon-button btn"
  end

end
