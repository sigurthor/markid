class AddDescriptionToBike < ActiveRecord::Migration
  def change
    add_column :bikes, :description, :text
    add_column :bikes, :year, :integer
  end
end
