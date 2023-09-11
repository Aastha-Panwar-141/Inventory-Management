class ProductVariant < ApplicationRecord
  validates :length, :width, presence: true, numericality: true
  
  belongs_to :product
  has_one :cart
  
end
