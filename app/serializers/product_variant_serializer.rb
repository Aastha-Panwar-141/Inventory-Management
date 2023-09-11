class ProductVariantSerializer < ActiveModel::Serializer
  attributes :id, :length, :width
  belongs_to :product
  
  # def products
  #   # byebug
  #   @object.product
  # end
end
