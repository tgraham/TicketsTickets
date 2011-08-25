class TicketsController < ApplicationController
  respond_to :html
  
  before_filter :authenticate_user!
  before_filter :set_current_user

  def index
    if params[:status]
      @tickets = Ticket.where(status: params[:status])
      @status = params[:status].humanize
    else
      @tickets = Ticket.all
    end
  end

  def new
    @ticket = Ticket.new
  end
  
  def create
    @ticket = Ticket.new(params[:ticket])
    @ticket.user_id = current_user._id
    if @ticket.save
      respond_to do |format|
        format.html { redirect_to show_ticket_path(@ticket.number), notice: 'Ticket successfully created.' }
      end
    else
      respond_to do |format|
        format.html { render :new }
      end
    end
  end

  def show
    @ticket = Ticket.where(number: params[:number]).first
  end

  def edit
    @ticket = @user.find_ticket(params[:number])
    @ticket.uploads.build
  end
  
  def update
    @ticket = @user.find_ticket(params[:ticket][:number])
    if @ticket.update_attributes(params[:ticket])
      redirect_to show_ticket_path(@ticket.number), notice: "Ticket #{@ticket.number} has been updated." and return
    else
      redirect_to :back, notice: "Something went wrong, try again."
    end
  end
end
