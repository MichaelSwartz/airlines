# class HomesController < Devise::RegistrationsController
class HomesController < ApplicationController
  layout "home"

  def index
    @airlines = Airline.page(params[:page])
  end
end
