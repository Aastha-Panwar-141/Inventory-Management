class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :update, :destroy]
    
    # GET /products
    def index
        products = Product.all 
        render json: products, include: ['product_variants']
        # render json: {products: products}, include: ['product_variants']
    end
    
    # GET /products/:id
    def show
        # render json: {product: @product}, include: ['product_variants']
        render json: @product
    end
    
    # POST /products
    def create
        # byebug
        product = Product.new(product_params)
        if product.save
            render json: {result: "Product created successfully!",created_record: product }, status: 201  #created 
        else
            render json: product.errors, status: :unprocessable_entity  #422 status code
        end
    end
    
    # PATCH/PUT /products/1
    def update
        # byebug
        if @product.update(product_params)
            render json: {result: "Product updated successfully!",updated_record: @product}, status: 200
        else
            render json: @product.errors, status: :unprocessable_entity
        end
    end
    
    # DELETE /products/1
    def destroy
        @product.destroy
        render json: {result: "Record deleted successfully!", deleted_record: @product}
    end
    
    
    def search 
      # byebug
      name = params[:name]
      if name.present?
        products = Product.where("name LIKE ?", "%#{name}%")
        render json: {result: products}
      else
        render json: {error: "No record found for given name."}
      end
    end
    
    def search_by_brand_name
      # byebug
      brand = params[:brand_name]
      if brand.present?
        products = Product.where("brand_name LIKE ?", "%#{brand}%")
        render json: {result: products}
      else
        render json: {error: "No product is available for this brand."}
      end
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_product
        begin
            @product = Product.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            render json: {result: "No record found for given id."} 
        end
    end
    
    # Only allow a trusted parameter "white list" through.
    def product_params
        params.require(:product).permit(:vendor_id, :name, :brand_name)
    end
    
  end
  