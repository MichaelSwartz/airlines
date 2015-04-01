class Admin::AirlinesController < ApplicationController
  before_action :authorize_admin!

  def index
    #@airlines = Airlines.all
  end

  protected

  def airline_parms
  end

end
