class Admin::AirlinesController < ApplicationController
  before_action :authorize_admin!

  def show
    @airline = Airline.find(params[:id])
    @reviews = @airline.reviews.page(params[:page])
  end

  protected

  def airline_parms
  end

end
