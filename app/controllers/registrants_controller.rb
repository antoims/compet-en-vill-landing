class RegistrantsController < ApplicationController

  def create
    @registrant = Registrant.new(registrant_params)

    if @registrant.save
      SlackNotificationService.new(@registrant).call
      redirect_to root_path, notice: "Merci pour votre inscription !"
    else
      redirect_to root_path, alert: "Une erreur est survenue, veuillez réessayer."
    end

  end

  private

  def registrant_params
    params.require(:registrant).permit(:email)
  end
end
