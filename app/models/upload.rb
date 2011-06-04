class Upload
  include Mongoid::Document
  
  field :ticket_id
  
  attr_accessible :ticket_id, :attachment
  belongs_to :ticket
  
  mount_uploader :attachment, AttachmentUploader
end
