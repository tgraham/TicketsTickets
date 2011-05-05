class DashboardsController < ApplicationController
  def dashboard
    @user = current_user
    logger.info "######## Check User: #{@user.inspect}"
  end

end
