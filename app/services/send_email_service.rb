class SendEmailService
  def initialize(registrant)
    @registrant = registrant
    @api_instance = SibApiV3Sdk::TransactionalEmailsApi.new
  end

  def call
    smtp_settings
    send_email
  end

  private

  def smtp_settings
    @send_smtp_email = {
      to: [{
        email: @registrant.email
      }],
      templateId: 5,
      params: {
        email: @registrant.email
      },
      headers: {
        X_Mailin_custom: 'content-type: application/json|accept: application/json'
      }
    }
  end

  def send_email
    begin
      result = @api_instance.send_transac_email(@send_smtp_email)
      puts result
    rescue SibApiV3Sdk::ApiError => e
      puts "Exception when calling SMTPApi->send_transac_email: #{e}"
    end
  end
end
