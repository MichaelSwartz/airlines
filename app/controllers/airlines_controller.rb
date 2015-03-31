class AirlinesController < ApplicationController
  # def index
  # end

  def new
    @airline = Airline.new
  end

  def show
    @airline = Airline.find(params[:id])
  end

  def create
    @airline = Airline.new(airline_params)
    if @airline.save
      flash[:notice] = "New Airline Added"
      redirect_to @airline
    else
      flash[:notice] = @airline.errors.full_messages.join(", ")
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
