class LocationsController < ApplicationController
  respond_to :html, :js
  
  before_filter :authenticate_user!
  before_filter :set_current_user
  
  def create_for_company
    @company  = Company.where(:slug => params[:company_id]).first
    @location = @company.locations.build(params[:location])

    if @location.save
      redirect_to @company, :notice => 'Company location created.'
    else
      render :new
    end
  end
  
  def destroy_for_company
    @company = Company.where(:slug => params[:company_id]).first
    @location = @company.locations.where(:slug => params[:id]).first
    
    redirect_to @company, :notice => 'You need at least one location. Please edit the company instead' and return if @company.locations.count == 1
    
    if @location.destroy
      redirect_to @company, :notice => "#{@company.company_name} has been removed."
    else
      redirect_to :back, :notice => "Something went wrong, try again."
    end
  end

end
