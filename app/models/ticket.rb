class Ticket
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :number, :type => Integer
  field :subject
  field :description
  field :priority
  field :status
  field :assigned_to
  
  index :number
  index :status
  index :subject
  
  validates :number, :subject, :description, :presence => true
  
  belongs_to_related :user
  embeds_many :replies
  
  attr_accessible :number, :subject, :description, :priority, :status, :assigned_to
  
  before_validation :generate_ticket_number
  
  PRIORITY = %w[Low Medium High]
  STATUS = %w[Open Answered Customer-Reply On-hold Closed]
  
  class << self
    def totals(status)
      where(:status => status).count
    end
  end
  
  private
  
  def generate_ticket_number
    ticket = Object.new
    while ticket
      random = rand(999999)
      ticket = Ticket.where(:number => random).first
    end
    self.number = random
  end
end
