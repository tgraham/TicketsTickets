class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
    
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  
  field :full_name
  field :username
  field :company_id

  slug :full_name, as: :name
  
  index :slug
  
  attr_accessor :login 
  # Setup accessible (or protected) attributes for your model
  # attr_accessible :full_name, :username, :login, :email, :password, :password_confirmation, :remember_me
  
  references_many :tickets
  has_many :assets
  has_many :tasks
  has_many :uploads
  belongs_to :company
  
  def find_ticket(number)
    tickets.where(number: number).first
  end
end