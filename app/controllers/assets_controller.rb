class AssetsController < ApplicationController
  respond_to :html
  
  before_filter :authenticate_user!
  before_filter :set_current_user
  before_filter :check_for_cancel, :only => [:create, :update]
  
  def index
    if params[:classification]
      @assets = Asset.where(:classification => params[:classification])
      @classification = params[:classification].humanize.singularize
    else
      @assets = Asset.all
    end
  end
  
  def show
    @asset = Asset.where(:slug => params[:id]).first
  end
  
  def new
    @asset = Asset.new
  end
  
  def create
    @asset = Asset.new(params[:asset])
    @asset.created_by = current_user.id
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
    @asset.updated_by = current_user.id
    if @asset.update_attributes(params[:asset])
      redirect_to assets_path, :notice => "#{@asset.name} has been updated." and return
    else
      redirect_to :back, :notice => "Something went wrong, try again."
    end
  end
  
  def destroy
  end
  
  private

  def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to assets_path, :notice => "You have canceled your request."
    end
  end

end
