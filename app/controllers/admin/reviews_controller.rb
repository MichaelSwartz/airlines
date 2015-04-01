module Admin
  class ReviewsController < ApplicationController
    before_action :authorize_admin!

    def destroy
      @review = Review.find(params[:format])
      @airline = @review.airline

      if @review.destroy
        flash[:notice] = "The review has been deleted"
      else
        flash[:notice] = "Failed to delete"
      end

      redirect_to admin_airline_path(@airline)
    end
    
  end
end
