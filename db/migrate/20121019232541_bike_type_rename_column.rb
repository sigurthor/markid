class BikeTypeRenameColumn < ActiveRecord::Migration
  def change
    rename_column :bike_types, :order, :type_order
  end

end
