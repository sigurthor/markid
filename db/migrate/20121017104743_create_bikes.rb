class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.string :name
      t.boolean :visible
      t.string :website
      t.string :fork
      t.string :group
      t.integer :bike_gear_id
      t.string :fork

      t.timestamps
    end
  end
end
