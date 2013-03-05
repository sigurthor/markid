class AddImageToBike < ActiveRecord::Migration
  def change
    add_column :bikes, :image, :string
  end
end
