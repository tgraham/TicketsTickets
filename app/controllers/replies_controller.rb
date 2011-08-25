class RepliesController < ApplicationController
  
  def create_for_ticket
    @ticket  = Ticket.where(_id: params[:ticket_id]).first
    @reply = @ticket.replies.build(params[:reply])
    @reply.user       = current_user
    @reply.user_email = current_user.email
    if @reply.save
      redirect_to tickets_path, notice:  "Reply sent." and return
    else
      redirect_to :back, notice:  "Please try again."
    end
  end
end
