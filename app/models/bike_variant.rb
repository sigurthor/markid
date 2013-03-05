class BikeVariant < ActiveRecord::Base
  belongs_to :bike

  attr_accessible :code, :size, :stock, :bike_id
end
