class UpvotesController < ApplicationController
  def create
    @airline = Review.find(params[:review_id]).airline
    unless current_user.nil?
      @upvote = Vote.find_by(user_id: current_user[:id],
                             review_id: params[:review_id])
    end
    case true
    when current_user.nil?
      flash[:notice] = "You need to be logged in to vote!"
    when @upvote.nil?
      @upvote = Vote.create(user_id: current_user[:id],
                            review_id: params[:review_id],
                            value: 1)
      flash[:notice] = "Upvote Created"
    when @upvote.value == 1
      flash[:notice] = "You've already upvoted!"
    else
      @upvote.value += 1
      @upvote.save
      flash[:notice] = "Upvote Submitted!"
    end
    redirect_to airline_path(@airline)
  end
end
