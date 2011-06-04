class TicketsController < AuthorizedController
  respond_to :html
  
  before_filter :authenticate_user!
  before_filter :set_current_user

  def index
    if params[:status]
      @tickets = Ticket.where(:status => params[:status])
      @status = params[:status].humanize
    else
      @tickets = Ticket.all
    end
  end

  def new
    @ticket = @user.tickets.build
  end
  
  def create
    @ticket = @user.tickets.build(params[:ticket])
    @ticket.uploads.build(params[:attachment])
    @ticket.status = 'open'
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

  def show
    @ticket = Ticket.where(:number => params[:number]).first
  end

  def edit
    @ticket = @user.find_ticket(params[:number])
  end
  
  def update
    @ticket = @user.find_ticket(params[:ticket][:number])
    if @ticket.update_attributes(params[:ticket])
      redirect_to show_ticket_path(params[:ticket][:number]), :notice => "Ticket #{@ticket.number} has been updated." and return
    else
      redirect_to :back, :notice => "Something went wrong, try again."
    end
  end
end
