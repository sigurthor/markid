class CreateBikeTypes < ActiveRecord::Migration
  def change
    create_table :bike_types do |t|
      t.string :name
      t.integer :order

      t.timestamps
    end

    create_table :bike_types_bikes, :id => false do |t|
      t.integer :bike_type_id
      t.integer :bike_id
    end
  end
end
