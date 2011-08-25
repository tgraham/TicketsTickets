class UploadsController < ApplicationController
  # before_filter :find_ticket
  
  
  def new
    @upload = Upload.new(:ticket_id: params[:ticket_id])
  end
  
  def create
    @ticket = Ticket.find(params[:ticket_id])
    @upload = Upload.new(params[:upload])
    @upload.user_id = current_user._id
    @upload.ticket_id = @ticket._id
    Rails.logger.info "## #{@upload.inspect}"
    if @upload.save
      redirect_to show_ticket_path(@ticket.number), notice: 'Attachment uploaded successfully'
    else
      redirect_to :back
    end
  end
  
private
  
  def find_ticket
    @ticket = Ticket.find(params[:ticket_id])
    Rails.logger.info "## #{@ticket.inspect}"
  end
end
