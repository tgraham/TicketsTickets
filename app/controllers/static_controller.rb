class StaticController < ApplicationController
  def index
    redirect_to dashboard_path unless !current_user
  end
end
