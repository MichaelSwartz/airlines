class AirlinesController < ApplicationController
  # def index
  # end

  def new
    @airline = Airline.new
  end

  def show
    @airline = Airline.find(params[:id])
    @reviews = Review.where(airline_id: @airline.id)
    @review = Review.new
  end

  def create
    @airline = Airline.new(airline_params)
    if @airline.save
      flash[:notice] = "New Airline Added"
      redirect_to @airline
    else
      render :new
    end
  end

  protected
  def airline_params
    params.require(:airline).permit(
      :name, :logo_url, :link_url, :description
    )
  end
end
