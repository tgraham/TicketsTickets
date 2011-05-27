class AuthorizedController < ApplicationController
  before_filter :authenticate_user!
  check_authorization
  authorize_resource
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :notice => exception.message
  end
end