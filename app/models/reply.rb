class Reply
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :user_email
  field :comment
  
  validates :comment, :presence => true
  
  referenced_in :user
  embedded_in :ticket, :inverse_of => :replies
  
  after_create :update_ticket
  
  private
    def ticket_status
      # user.is_admin? ? 'answered' : 'customer_reply'
      'answered'
    end
    
    def update_ticket
      ticket.update_attributes(:status => ticket_status)
    end
end
