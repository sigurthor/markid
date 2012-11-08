class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.boolean :visible
      t.string  :type

      t.timestamps
    end
  end
end
