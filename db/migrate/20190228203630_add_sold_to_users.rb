class AddSoldToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sold, :float
  end
end
