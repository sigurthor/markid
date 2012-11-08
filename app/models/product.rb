class Product < ActiveRecord::Base
  belongs_to :productable, :polymorphic => true
  attr_accessible :code, :name, :visible, :productable_id, :productable_type
end
