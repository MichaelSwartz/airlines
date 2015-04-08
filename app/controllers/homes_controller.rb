# class HomesController < Devise::RegistrationsController
class HomesController < ApplicationController
  layout "home"

  def index
    # self.resource = resource_class.new(sign_in_params)
    # clean_up_passwords(resource)
    # yield resource if block_given?
    # respond_with(resource, serialize_options(resource))
  end
end
