class Image < ActiveRecord::Base
  has_and_belongs_to_many :bikes
  attr_accessible :description, :name, :url
end
