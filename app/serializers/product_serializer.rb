class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :brand_name
  has_many :product_variants
end
