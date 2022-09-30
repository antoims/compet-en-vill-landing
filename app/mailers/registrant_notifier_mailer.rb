class RegistrantNotifierMailer < ApplicationMailer
  def send_welcome_email(registrant)
    @registrant = registrant
    mail(
      to: @registrant.email,
      subject: "🇫🇷 Bienvenue dans l'aventure Compet' en Vill' .22 ⚽️ 🏀"
    )
  end
end
