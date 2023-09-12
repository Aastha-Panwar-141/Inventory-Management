class Product < ApplicationRecord
  validates :name, :brand_name, presence: true
  belongs_to :vendor
  has_many :product_variants, dependent: :destroy
  has_one_attached :avatar
  
  after_create :product_created
  after_create do
    self.product_variants.create(length: 0, width: 0, product_id: self.id)
  end
  
  # scope :product_length, -> {where(product_variants: length)}
  
  def product_created
    puts "Product Created Successfully!"
  end
end
