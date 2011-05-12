class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by_name(params[:id])
  end
  
  def add_to_company
    @users = User.find(params[:user_ids])
    @company = Company.find(params[:company])
    @users.each do |user|
      user.company = @company
      user.save!
    end
    redirect_to :back, :notice => 'Users added.'
  end
end
