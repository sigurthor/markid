class NumberOfGears < ActiveRecord::Base
  attr_accessible :gears
  has_many :bikes
end
