class CartSerializer < ActiveModel::Serializer
  attributes :id, :customer_name, :product_name, :product_brand_name, :product_length, :product_width
  
  def customer_name
    object.customer.first_name
  end

  def product_name
    object.product_variant.product.name
  end

  def product_brand_name
    object.product_variant.product.brand_name
  end

  def product_length
    object.product_variant.length
  end

  def product_width
    object.product_variant.width
  end

  # attributes :customer_name do 
  #   byebug
  #   @object.customer.first_name
  # end  
end
