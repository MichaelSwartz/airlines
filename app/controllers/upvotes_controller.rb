class UpvotesController < ApplicationController

  def create
    binding.pry
    @upvote = Vote.find_by(user_id: current_user[:id], review_id: params[:review_id])
    if Vote.exists?(@upvote.id)
      @upvote.vote += 1
      @upvote.save
    else
      @upvote = Vote.create(user_id: current_user[:id], review_id: params[:review_id], vote: 1)
    end
  end
end
