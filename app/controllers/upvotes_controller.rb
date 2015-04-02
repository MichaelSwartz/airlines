class UpvotesController < ApplicationController

  def create
    @upvote = Vote.find_by(user_id: current_user[:id], review_id: params[:review_id])
    @airline = Review.find(params[:review_id]).airline
    if @upvote
      @upvote.value += 1
      @upvote.save
      flash[:notice] = "Upvote Submitted"
    else
      @upvote = Vote.create(user_id: current_user[:id], review_id: params[:review_id], value: 1)
      flash[:notice] = "Upvote Created"
    end
    redirect_to airline_path(@airline)
  end
end
