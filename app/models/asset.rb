class Asset
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  
  field :company_id
  field :name
  field :description
  field :os
  field :location
  field :classification
  field :peripherals
  field :anti_virus
  field :software
  field :firmware
  field :serial_number
  field :asset_tag
  field :part_number
  field :warranty
  field :ip
  field :user_id
  field :user_name
  field :user_password
  field :updated_by
  field :created_by
  
  index :classification
  index :os
  index :location
  index :name
  index :asset_tag
  index :ip
  
  belongs_to :user
  belongs_to :company
  
  slug :name
  
  def create_user
    User.find(self.created_by).full_name
  end
    
  def update_user
    return unless !self.updated_by.nil?
    User.find(self.updated_by).full_name
  end
  
  class << self
    def totals(classification)
      where(:classification => classification).count
    end
  end
end
