class Task
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes
  include Mongoid::Timestamps
  include Mongoid::Slug
  
  field :name
  field :user_id
  field :due_at,            :type => Date
  field :start_time,        :type => Time
  field :finish_time,       :type => Time
  field :start_mileage,     :type => Integer
  field :finish_mileage,    :type => Integer
  field :private,           :type => Boolean,         :default => false
  
  index :name
  
  slug :name
  
  belongs_to :user
  
  validates :name, :presence => true
  
  scope :public,   where(:private => false)
  scope :private,  where(:private => true)
  
  def mileage
    return unless self.finish_mileage && self.start_mileage
    self.finish_mileage - self.start_mileage
  end
end
