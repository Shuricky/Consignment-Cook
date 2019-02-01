class CreateShoes < ActiveRecord::Migration[5.2]
  def change
    create_table :shoes do |t|
      t.string :sku
      t.string :size
      t.integer :quantity
      t.float :price


      t.timestamps
    end
  end
end
