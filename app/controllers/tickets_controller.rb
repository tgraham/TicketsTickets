class TicketsController < ApplicationController
  respond_to :html
  
  before_filter :authenticate_user!
  before_filter :set_current_user
  
  def new
    @ticket = @user.tickets.build
  end
  
  def create
    @ticket = @user.tickets.build(params[:ticket])
    @ticket.status = 'Open'
    if @ticket.save
      respond_to do |format|
        format.html { redirect_to dashboard_path, :notice => 'Ticket successfully created.' }
      end
    else
      respond_to do |format|
        format.html { render :new }
      end
    end
  end
end
