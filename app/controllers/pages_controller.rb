class PagesController < ApplicationController

  def home
    @registrant = Registrant.new
    @registrants_count = Registrant.count + 120
  end
end
