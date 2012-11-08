class Brand < ActiveRecord::Base
  has_many :bikes
  attr_accessible :description, :name
end
