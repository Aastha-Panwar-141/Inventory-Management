class Customer < User
  include Validatable
  has_one :cart, foreign_key: 'customer_id'
end
