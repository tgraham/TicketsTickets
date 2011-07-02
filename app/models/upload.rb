class Upload
  include Mongoid::Document
  
  mount_uploader :attachment, AttachmentUploader
  
  belongs_to :ticket
  belongs_to :user
  # attr_accessible :attachment
  
  field :ticket_id
  field :user_id
  field :attachment
  
end
