class AddNumberOfGearsToBike < ActiveRecord::Migration
  def up
    add_column :bikes, :number_of_gears_id, :integer
    remove_column :bikes, :bike_gear_id
  end

  def down
    remove_column :bikes, :number_of_gears_id

  end
end
