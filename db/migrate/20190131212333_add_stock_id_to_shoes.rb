class AddStockIdToShoes < ActiveRecord::Migration[5.2]
  def change
    add_column :shoes, :stockId, :string
  end
end
