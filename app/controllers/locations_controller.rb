class LocationsController < ApplicationController
  respond_to :html, :js
  
  before_filter :authenticate_user!
  before_filter :set_current_user
  
  def create_for_company
    @company  = Company.where(:_id => params[:company_id]).first
    @location = @company.locations.build(params[:location])

    if @location.save
      redirect_to companies_path, :notice => 'Company location created.'
    else
      render :new
    end
  end

end
