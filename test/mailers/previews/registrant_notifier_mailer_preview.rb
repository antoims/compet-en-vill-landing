# Preview all emails at http://localhost:3000/rails/mailers/registrant_notifier_mailer
class RegistrantNotifierMailerPreview < ActionMailer::Preview
   def send_welcome_email
    registrant_notifier = Registrant.first
    RegistrantNotifierMailer.send_welcome_email(registrant_notifier)
   end

end

# http://localhost:3000/rails/mailers/registrant_notifier_mailer/send_welcome_email
