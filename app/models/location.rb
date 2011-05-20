class Location
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  include Geocoder::Model::Mongoid
  include Gmaps4rails::ActsAsGmappable
  
  acts_as_gmappable
  
  field :name
  field :address
  field :city
  field :state
  field :zip_code
  field :country
  field :phone_number
  
  field :latitude,        :type => Float
  field :longitude,       :type => Float
  field :gmaps,           :type => Boolean
  
  slug :name
  
  index :slug, :name
  
  embedded_in :company, :inverse_of => :locations


  def gmaps4rails_address
    "#{self.address}, #{self.city}, #{self.state}, #{self.zip_code} #{self.country}"
  end
  
  def gmaps4rails_infowindow
    "<h5>#{name}</h5>" +
    "#{address}<br />" +
    "#{city}, #{state} #{zip_code}"
  end
  
  def gmaps4rails_title
    name
  end
  
  def lat
    self.coordinates[1]
  end
  
  def lng
    self.coordinates[0]
  end
end