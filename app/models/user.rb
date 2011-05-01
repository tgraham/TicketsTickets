class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  before_save :generate_slug
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  
  field :first_name, type: String
  field :last_name, type: String
  field :login, type: String
  field :slug, type: String
  
  # Setup accessible (or protected) attributes for your model
  #attr_accessible :first_name, :last_name, :login, :slug, :email, :password, :password_confirmation, :remember_me

  def name
    self.first_name + ' ' + self.last_name
  end  
  
  private 
    def generate_slug
      self.slug = login.parameterize
    end

end