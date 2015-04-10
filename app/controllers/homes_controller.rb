class HomesController < ApplicationController
  layout "home"

  def index
    @airlines = Airline.limit(6)
    if signed_in?
      @user = User.find(current_user[:id])
       @user_photo = @user[:profile_photo]
    end
  end
end
