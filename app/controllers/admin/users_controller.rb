require 'set'

module Admin
  class UsersController < ApplicationController
    before_action :authorize_admin!

    def index
      @users = User.page(params[:page])
    end

    def show
      @user = User.find(params[:id])
      airlines_reviewed = Set.new

      @user.reviews.each do |review|
        airlines_reviewed << review.airline
      end

      @reviews = Hash.new
      airlines_reviewed.each do |airline|
        reviews = @user.reviews.where(airline: airline)
        @reviews[airline] = reviews
      end
    end

    def destroy
      @user = User.find(params[:id])

      if @user.destroy
        flash[:alert] = "User deleted"
      else
        flash[:alert] = "Failed to delete"
      end
      redirect_to admin_users_path
    end
  end
end
