class Location
  attr_accessor :address, :lat, :lng

  def initialize(address, lat, lng)
    @address = address
    @lat = lat
    @lng = lng
  end

  def to_s; address.to_s; end

end