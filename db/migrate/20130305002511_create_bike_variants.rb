class CreateBikeVariants < ActiveRecord::Migration
  def change
    create_table :bike_variants do |t|
      t.string :size
      t.string :code
      t.integer :stock
      t.integer :bike_id

      t.timestamps
    end
  end
end
