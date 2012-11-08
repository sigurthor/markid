class BikeType < ActiveRecord::Base
  attr_accessible :name, :order
  has_and_belongs_to_many :bikes
end
