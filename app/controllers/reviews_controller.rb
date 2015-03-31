class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.new(review_params)
    if @review.save
      flash[:notice] = 'Review successfully created'
      redirect_to reviews_path
    else
      flash[:notice] = 'Rating can\'t be blank'
      render :new
    end
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    if @review.save
      flash[:notice] = 'Review successfully edited'
      redirect_to reviews_path
    else
      flash[:notice] = 'Rating can\'t be blank'
      render :new
    end
  end

  protected

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
