class RegistrantNotifierMailer < ApplicationMailer
  def send_welcome_email(registrant)
    @registrant = registrant
    mail(
      to: @registrant.email,
      subject: 'Thanks for signing up for our amazing app'
    )
  end
end
