class DashboardsController < ApplicationController
  before_filter :set_current_user
  
  def dashboard
    logger.info "######## Check User: #{@user.inspect}"
  end

end
