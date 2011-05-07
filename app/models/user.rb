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

  slug :full_name, :as => :name
  
  index :slug
  
  attr_accessor :login 
  # Setup accessible (or protected) attributes for your model
  attr_accessible :full_name, :username, :login, :email, :password, :password_confirmation, :remember_me
  
  references_many :tickets

protected
  
  def self.find_for_database_authentication(conditions)
    login = conditions.delete(:login)
    self.any_of({ :username => login }, { :email => login }).first
  end
end
