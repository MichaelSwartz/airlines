class AirlinesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @airlines = Airline.page(params[:page])
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
    sorted_reviews = @airline.reviews.to_a.sort_by! { |review| -review.total_votes }
    @reviews = Kaminari.paginate_array(sorted_reviews).page(params[:page])
    @review = Review.new
  end

  def create
    @airline = current_user.airlines.new(airline_params)
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
