class CreateNumberOfGears < ActiveRecord::Migration
  def change
    create_table :number_of_gears do |t|
      t.integer :gears

      t.timestamps
    end
  end
end
