class Bike < ActiveRecord::Base
  belongs_to :suspension_type
  belongs_to :number_of_gears
  belongs_to :suspension_type
  belongs_to :brand
  has_and_belongs_to_many :images
  has_and_belongs_to_many :bike_types
  attr_accessible :name, :visible, :website ,:fork, :bike_type_ids,:brand_id, :image_ids,  :group, :suspension_type_id, :number_of_gears_id ,:product_attributes, :description, :year

  before_save :update_info

  private

  def update_info
      #self.website = "http://www.scott-sports.com"
  end
 #accepts_nested_attributes_for :bike_types
end
