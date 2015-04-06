require 'set'

module Admin
  class UsersController < ApplicationController
    before_action :authorize_admin!

    def index
      @users = User.order(admin: :desc, created_at: :asc).page(params[:page])
    end

    def show
      @user = User.find(params[:id])
      @reviews = @user.reviews_by_airline
    end

    def update
      @user = User.find(params[:id])
      @user.update(admin: true)
      flash[:alert] = "New admin authorized"
      redirect_to admin_users_path
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
