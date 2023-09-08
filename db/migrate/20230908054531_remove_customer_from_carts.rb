class RemoveCustomerFromCarts < ActiveRecord::Migration[7.0]
  def change
    remove_reference :carts, :customer, null: false, foreign_key: true
  end
end
