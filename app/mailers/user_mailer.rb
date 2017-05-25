class UserMailer < ApplicationMailer

  def forgot_email(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: 'Welcome to Le Wagon')
  end
end
