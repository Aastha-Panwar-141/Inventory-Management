class ProductVariantsController < ApplicationController
    before_action :set_product_variant, only: [:show, :update, :destroy]
    
    # GET /product_variants
    def index
        product_variants = ProductVariant.all 
        # render json: {product_variants: product_variants}
        render json: product_variants
    end
        
    # GET /product_variants/:id
    def show
        # render json: {product_variant: @product_variant}
        render json: product_variant
    end
    
    # POST /product_variants
    def create
        # byebug
        product_variant = ProductVariant.new(product_variant_params)
        if product_variant.save
            render json: {result: 'Product variant created successfully!',created_record: product_variant}, status: 201  #created 
        else
            render json: product_variant.errors, status: :unprocessable_entity  #422 status code
        end
    end
    
    # PATCH/PUT /product_variants/1
    def update
        # byebug
        if @product_variant.update(product_variant_params)
            render json: {result: 'Product updated successfully!',updated_record: @product_variant}
        else
            render json: @product_variant.errors, status: :unprocessable_entity
        end
    end
    
    # DELETE /product_variants/1
    def destroy
        @product_variant.destroy
        render json: {result: "Record deleted successfully!", deleted_record: @product_variant}

    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_product_variant
        # byebug
        begin
            @product_variant = ProductVariant.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            render json: {error: 'No record found for given id.'}
        end
    end
    
    # Only allow a trusted parameter "white list" through.
    def product_variant_params
        params.require(:product_variant).permit(:product_id, :length, :width)
    end
end
