class Company
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  include Geocoder::Model::Mongoid
  
  field :name
  field :address
  field :city
  field :state
  field :zip_code
  field :country
  field :phone_number
  field :web_address
  field :notes
  field :coordinates, :type => Array
  
  
  slug :name
  
  index :slug, :name
  
  has_many :users
  references_many :assets
  
  before_create :url_with_protocol
  before_update :url_with_protocol
  after_validation :geocode
  
  geocoded_by :full_street_address
  
  def url_with_protocol
    addy = self.web_address
    self.web_address = /^http/.match(addy) ? addy : "http://#{addy}" unless addy.blank?
  end
  
  def full_street_address
    "#{self.address}, #{self.city}, #{self.state}, #{self.zip_code}, #{self.country}"
  end
  
  def lat
    self.coordinates[1]
  end
  
  def lng
    self.coordinates[0]
  end
  
end
