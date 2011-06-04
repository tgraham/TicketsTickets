class UploadsController < ApplicationController
  authorize_resource
  
  def new
    @upload = Upload.new(:ticket_id => params[:ticket_id])
  end

  def create
    @ticket = Ticket.find_by_number(params[:ticket_number])
    @upload = Upload.new(params[:upload])
    @upload.ticket_id = @ticket.id
    if @upload.save
      flash[:notice] = "Successfully uploaded attachment."
      redirect_to @ticket
    else
      render :action => 'new'
    end
  end
  
  def download
    @upload = Upload.find(params[:id])
    file = @upload.attachment.url
    
    send_file file, :type => @upload.content_type, :disposition => 'inline'
    return
  end
end
