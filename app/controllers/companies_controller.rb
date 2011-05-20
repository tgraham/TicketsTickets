class CompaniesController < ApplicationController
  respond_to :html
  
  before_filter :authenticate_user!
  before_filter :set_current_user
  
  def index
    @companies = Company.all
  end
  
  def show
    @company = Company.where(:slug => params[:id]).first
    @json = Company.where(:slug => params[:id]).first.to_gmaps4rails
    @all_users = User.all
    @company_users = @company.users
    @users = @all_users - @company_users
  end
  
  def new
    @company = Company.new
  end
  
  def create
    @company = Company.new(params[:company])
    if @company.save
      redirect_to companies_path, :notice => 'Company created.'
    else
      render :new
    end
  end
  
  def edit
    @company = Company.where(:slug => params[:id]).first
  end
  
  def update
    @company = Company.where(:slug => params[:id]).first
    if @company.update_attributes(params[:company])
      redirect_to companies_path, :notice => "#{@company.name} has been updated." and return
    else
      redirect_to :back, :notice => "Something went wrong, try again."
    end
  end
  
  def destroy
    @company = Company.where(:slug => params[:id]).first
    if @company.destroy
      redirect_to companies_path, :notice => "#{@company.name} has been removed."
    else
      redirect_to :back, :notice => "Something went wrong, try again."
    end
  end
end
