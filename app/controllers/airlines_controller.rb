class AirlinesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  def index
    @airlines = Airline.all
  end

  def update
    @airline = Airline.find(params[:id])
    if @airline.update(airline_params)
      flash[:notice] = "Airline updated"
      redirect_to @airline
    else
      flash[:notice] = @airline.errors.full_messages.join(", ")
      render :edit
    end
  end

  def edit
    @airline = Airline.find(params[:id])
  end

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
      flash[:notice] = @airline.errors.full_messages.join(", ")
      render :new
    end
  end

  def destroy
    @airline = Airline.find(params[:id])

    if @airline.destroy
      flash[:notice] = "Airline deleted"
      redirect_to airlines_path
    else
      flash[:notice] = @airline.errors.full_messages.join(", ")
      render :edit
    end
  end


  protected
  def airline_params
    params.require(:airline).permit(
      :name, :logo_url, :link_url, :description
    )
  end
end
