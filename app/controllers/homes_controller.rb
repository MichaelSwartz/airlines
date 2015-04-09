class HomesController < ApplicationController
  layout "home"

  def index
    @airlines = Airline.sort_by_rating[0..2]
  end
end
