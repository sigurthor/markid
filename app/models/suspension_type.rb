class SuspensionType < ActiveRecord::Base
  has_many :bikes
  attr_accessible :name
end
