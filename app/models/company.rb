class Company
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :company_name
  field :web_address
  field :notes  
  
  slug :company_name
  
  index :slug, :company_name
  
  has_many :users
  has_many :assets
  embeds_many :locations, :allow_destroy => true
  
  accepts_nested_attributes_for :locations
  
  before_create :url_with_protocol
  before_update :url_with_protocol
  
  validates :company_name, :uniqueness => true
  
  def url_with_protocol
    addy = self.web_address
    self.web_address = /^http/.match(addy) ? addy : "http://#{addy}" unless addy.blank?
  end
end
