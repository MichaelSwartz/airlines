class DownvotesController < ApplicationController
  def create
    @airline = Review.find(params[:review_id]).airline
    unless current_user.nil?
      @downvote = Vote.find_by(user_id: current_user[:id],
                               review_id: params[:review_id])
    end
    case true
    when current_user.nil?
      flash[:notice] = "You need to be logged in to vote!"
    when @downvote.nil?
      @downvote = Vote.create(user_id: current_user[:id],
                              review_id: params[:review_id],
                              value: -1)
      flash[:notice] = "Downvote Created"
    when @downvote.value == -1
      flash[:notice] = "You've already downvoted!"
    else
      @downvote.value -= 1
      @downvote.save
      flash[:notice] = "Downvote Submitted!"
    end
    redirect_to airline_path(@airline)
  end
end
