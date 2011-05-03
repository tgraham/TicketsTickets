class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  
  before_create :create_login
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  
  field :full_name, type: String
  field :username, type: String

  slug :full_name, :as => :name
  
  attr_accessor :login 
  # Setup accessible (or protected) attributes for your model
  attr_accessible :full_name, :username, :login, :email, :password, :password_confirmation, :remember_me

protected
  
  def create_login             
    email = self.email.split(/@/)
    login_taken = User.where( :login => email[0]).first 
    unless login_taken
      self.login = email[0]
    else	
      self.login = self.email
    end	       
  end
  
  # def self.find_for_database_authentication(conditions)
  #   login = conditions.delete(:login)
  #   self.any_of({ :username => login }, { :email => login }).first
  # end

  def self.find_for_database_authentication(conditions)
    self.where(:login => conditions[:email]).first || self.where(:email => conditions[:email]).first
  end
  
end
