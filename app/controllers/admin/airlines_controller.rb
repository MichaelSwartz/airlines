class Admin::AirlinesController < ApplicationController
  before_action :authorize_admin!

  def index
    @airlines = Airline.page(params[:page])
  end

  def show
    @airline = Airline.find(params[:id])
    @reviews = @airline.reviews.page(params[:page])
    @review = Review.new
  end

  def new
    @airline = Airline.new
  end

  def edit
    @airline = Airline.find(params[:id])
  end

  def create
    @airline = current_user.airlines.new(airline_params)
    if @airline.save
      flash[:notice] = "New Airline Added"
      redirect_to @airline
    else
      flash[:alert] = @airline.errors.full_messages.join(", ")
      render :new
    end
  end

  def update
    @airline = Airline.find(params[:id])
    if @airline.update(airline_params)
      flash[:notice] = "Airline updated"
      redirect_to @airline
    else
      flash[:alert] = @airline.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    @airline = Airline.find(params[:id])
    @airline.destroy
    flash[:alert] = "Airline deleted"
    redirect_to admin_airlines_path
  end

  protected

  def airline_params
    params.require(:airline).permit(
      :name, :logo_url, :link_url, :description
    )
  end
end
