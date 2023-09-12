class ProductSerializer < ActiveModel::Serializer
  
  attributes :id, :name, :brand_name, :image
  has_many :product_variants
  def image
    # object.avatar.map do |img|
      Rails.application.routes.url_helpers.rails_blob_url(object.avatar, only_path: true) if object.avatar.attached?
    # end
      
    # object.avatar.
  end
end
