class RegistrantsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @registrant = Registrant.new(registrant_params)

    if @registrant.save
      SlackNotificationService.new(@registrant).call
      RegistrantNotifierMailer.send_welcome_email(@registrant).deliver_later
      render json: {
        status: true,
        popup: render_to_string(partial: "registrant_popup", locals: { registrant: @registrant }),
        counter: Registrant.count
      }
    else
      render json: {
        alert: render_to_string(partial: "shared/flashes", locals: { alert: translate_error(@registrant.errors.messages[:email].first)})
      }
    end

  end

  private

  def translate_error(error)
    case error
    when "has already been taken"
      "Cette adresse mail est déjà utilisée."
    when "can't be blank"
      "Veuillez renseigner une adresse email."
    when "L'adresse mail n'est pas valide"
      error
    else
      "Une erreur est survenue, veuillez réessayer."
    end

  end

  def registrant_params
    params.require(:registrant).permit(:email)
  end
end
