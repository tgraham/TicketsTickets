class AssetsController < ApplicationController
  respond_to :html
  
  before_filter :authenticate_user!
  before_filter :set_current_user
  
  def index
    @assets = Asset.all
  end
  
  def show
    @asset = Asset.where(:slug => params[:id]).first
  end
  
  def new
    @asset = Asset.new
  end
  
  def create
    @asset = Asset.new(params[:asset])
    if @asset.save
      redirect_to assets_path, :notice => 'Asset created.'
    else
      render :new
    end
  end
  
  def edit
    @asset = Asset.where(:slug => params[:id]).first
  end
  
  def update
    @asset = Asset.where(:slug => params[:id]).first
    if @asset.update_attributes(params[:asset])
      redirect_to assets_path, :notice => "#{@asset.name} has been updated." and return
    else
      redirect_to :back, :notice => "Something went wrong, try again."
    end
  end
  
  def destroy
  end
end
