class Reply
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :user_email
  field :comment
  
  validates :comment, :presence => true
  
  referenced_in :user
  embedded_in :ticket, :inverse_of => :replies
  
end
