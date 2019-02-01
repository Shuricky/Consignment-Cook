class AddSoldToShoes < ActiveRecord::Migration[5.2]
  def change
    add_column :shoes, :sold, :boolean, :default => false
  end
end
