class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.contact_flat_owner.subject
  #
  def contact_flat_owner(owner, mail_content)
    puts "J'essaie d'envoyer un mail"
    @receiver = owner
    @content = mail_content
    mail(to: owner.email, subject: "Je souhaite avoir plus d'informations sur votre bien")
  end
end
