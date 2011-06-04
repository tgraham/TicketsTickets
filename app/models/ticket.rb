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
  
  validates :subject, :description, :presence => true
  
  belongs_to_related :user
  embeds_many :replies
  has_many :uploads
  
  attr_accessible :number, :subject, :description, :priority, :status, :assigned_to
  
  before_create :generate_ticket_number
  
  PRIORITY = %w[Low Medium High]
  STATUS = %w[open answered customer_reply on_hold closed]
  
  def tech
    User.where(:_id => self.assigned_to).first.full_name
  end
  
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
