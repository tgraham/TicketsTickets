class Company
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  
  field :name
  field :address
  field :city
  field :state
  field :zip_code
  field :country
  field :phone_number
  field :web_address
  
  
  slug :name
  
  index :slug, :name
  
  references_many :users
  references_many :assets
  
  before_create :url_with_protocol
  before_update :url_with_protocol
  
  def url_with_protocol
    self.web_address = /^http/.match(self.web_address) ? self.web_address : "http://#{self.web_address}"
  end
  
end
