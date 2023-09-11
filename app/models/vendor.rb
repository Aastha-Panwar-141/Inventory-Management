class Vendor < User
  include Validatable
  has_many :products, foreign_key: 'vendor_id'
end
