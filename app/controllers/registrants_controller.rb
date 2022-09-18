class RegistrantsController < ApplicationController

  def create
    @registrant = Registrant.new(registrant_params)

    if @registrant.save
      SlackNotificationService.new(@registrant).call
      redirect_to root_path, notice: "Merci pour votre inscription !"
    else
      p @registrant.errors.full_messages
      redirect_to root_path, alert: @registrant.errors.full_messages.join(", ")
    end

  end

  private

  def registrant_params
    params.require(:registrant).permit(:email)
  end
end
