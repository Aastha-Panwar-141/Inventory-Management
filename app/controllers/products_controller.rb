class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :update, :destroy]
    
    # GET /products
    def index
        @products = Product.all 
        render json: @products
    end
    
    def new
    end
    
    # GET /products/:id
    def show
        render json: @product
    end
    
    # POST /products
    def create
        # byebug
        @product = Product.new(product_params)
        if @product.save
            render json: @product, status: 200  #created 
        else
            render json: @product.errors, status: :unprocessable_entity  #422 status code
        end
    end
    
    # PATCH/PUT /products/1
    def update
        if @product.update(product_params)
            rendor json: @product, status: 200
        else
            rendor json: @product.errors, status: :unprocessable_entity
        end
    end
    
    # DELETE /products/1
    def destroy
        @product.destroy
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_product
        @product = Product.find(params[:id])
    end
    
    # Only allow a trusted parameter "white list" through.
    def product_params
        params.require(:product).permit(:vendor_id, :name, :brand_name)
    end
    
    def search 
        name = params[:name]
        if name.present?
            @products = Product.where("name LIKE ?", "%#{name}%")
            render json: @products
        else
            render json: {error: "Name parameter is required."}
        end
    end

    def search_by_brand_name
        # byebug
        brand = params[:brand_name]
        if brand.present?
            @products = Product.where("brand_name LIKE ?", "%#{brand}%")
            render json: @products
        else
            render json: {error: "No product is available for this brand."}
        end
    end


end
