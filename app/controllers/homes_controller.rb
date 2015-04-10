class HomesController < ApplicationController
  layout "home"

  def index
    @airlines = Airline.limit(6)
  end
end
