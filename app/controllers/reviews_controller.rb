class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
    @airline = Airline.find(params[:airline_id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.new(review_params)
    @review.airline_id = params[:airline_id]
    if @review.save
      flash[:notice] = 'Review successfully created'
      redirect_to airline_path(@review.airline_id)
    else
      flash[:notice] = 'Rating can\'t be blank'
      redirect_to airline_path(@review.airline_id)
    end
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    @airline = Airline.find(@review.airline_id)
    if @review.save
      flash[:notice] = 'Review successfully edited'
      redirect_to airline_path(@airline)
    else
      flash[:notice] = 'Rating can\'t be blank'
      redirect_to airline_review_path(airline_id: @airline.id, id: @review.id)
    end
  end
  
  def destroy
    @review = Review.find(params[:id])
    @airline = Airline.find(@review.airline_id)
    if @review.destroy
      flash[:notice] = 'Review successfully deleted'
      redirect_to airline_path(@airline)
    else
      flash[:alert] = "Something went wrong"
      redirect_to airline_path(@airline)
    end
  end

  protected

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
