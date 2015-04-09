class HomesController < ApplicationController
  layout "home"

  def index
    @airlines = Airline.limit(3)
  end
end
