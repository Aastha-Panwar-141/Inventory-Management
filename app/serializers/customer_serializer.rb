class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :favorite_brand
  has_one :cart
end
