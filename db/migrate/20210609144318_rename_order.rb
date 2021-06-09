class RenameOrder < ActiveRecord::Migration[5.2]
  def change
    rename_table :orders, :item_carts
  end
end
