class RemoveNumberSoldFromShoes < ActiveRecord::Migration[5.2]
  def change
    remove_column :shoes, :NumberSold, :integer
  end
end
