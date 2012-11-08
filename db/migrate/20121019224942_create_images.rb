class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.string :url
      t.string :description

      t.timestamps
    end

    create_table :bikes_images, :id => false do |t|
      t.integer :image_id
      t.integer :bike_id
    end
  end
end
