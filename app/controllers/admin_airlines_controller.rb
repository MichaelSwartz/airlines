class Admin::AirlinesController < ApplicationController
  before_action :authorize_admin!

  def index
    #@airlines = Airlines.all
    render 'airlines/index'
    render 'admin/airlines/index'
  end

  protected

  def airline_parms
  end


end
