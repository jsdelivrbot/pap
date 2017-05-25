class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.contact_flat_owner.subject
  #
  def contact_flat_owner(owner)
    @receiver = owner

    mail(to: @owner.email, subject: "Je souhaite avoir plus d'informations sur votre bien")
  end
end
