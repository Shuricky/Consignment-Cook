class AddNumberSoldToShoes < ActiveRecord::Migration[5.2]
  def change
    add_column :shoes, :NumberSold, :integer, :null => false, :default => 0
  end
end
