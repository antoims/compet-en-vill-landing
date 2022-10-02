require 'sib-api-v3-sdk'

class TestService

# Setup authorization
  def call

    api_instance =
    send_smtp_email = SibApiV3Sdk::SendSmtpEmail.new # SendSmtpEmail | Values to send a transactional email
    send_smtp_email = {
      sender: {
        name: "Test",
        email: "benjbdk@gmail.com"
      },
      to: [
        {
          email: "benjbdk@gmail.com"
        }
      ],
      html_content: "Hello, <br> This is a test email",
      subject: "Test email"
    }

    begin
      #Send a transactional email
      result = api_instance.send_transac_email(send_smtp_email)
      puts result
    rescue SibApiV3Sdk::ApiError => e
      puts "Exception when calling SMTPApi->send_transac_email: #{e}"
    end
  end


end
