class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
    @airline = @review.airline
  end

  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.new(review_params)
    @review.airline_id = params[:airline_id]
    if @review.save
      ReviewNotifier.new_review(@review).deliver_later
      flash[:notice] = 'Review successfully created'
      redirect_to airline_path(@review.airline_id)
    else
      flash[:alert] = 'Rating can\'t be blank'
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
      flash[:alert] = 'Rating can\'t be blank'
      redirect_to airline_review_path(@airline, @review)
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @airline = Airline.find(@review.airline_id)
    if @review.destroy
      flash[:notice] = 'Review successfully deleted'
    else
      flash[:alert] = "Something went wrong"
    end
    redirect_to airline_path(@airline)
  end

  protected

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
