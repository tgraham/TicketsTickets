class Ticket
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  
  field :subject
  field :description
  field :priority
  field :status

  slug :status, :as => :status
  slug :subject, :as => :subject
  
  attr_accessible :subject, :description, :priority, :status
  
  PRIORITY = %w[Low Medium High]
  STATUS = %w[Open Answered Customer-Reply On-hold Closed]
  
  validates :subject, :description, :presence => true
  
  belongs_to_related :user
  
  class << self
    
    def totals(status)
      where(:status => status).count
    end
  end
  
end
