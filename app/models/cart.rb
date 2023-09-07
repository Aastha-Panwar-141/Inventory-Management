class Cart < ApplicationRecord
  belongs_to :customer, foreign_key: 'customer_id'
  belongs_to :product_variant
end
