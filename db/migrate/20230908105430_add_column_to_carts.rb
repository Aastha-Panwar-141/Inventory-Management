class AddColumnToCarts < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :customer_id, :integer
  end
end