class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  
  field :full_name, type: String
  field :login, type: String

  slug :full_name, :as => :name
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :full_name, :login, :email, :password, :password_confirmation, :remember_me

 
end
