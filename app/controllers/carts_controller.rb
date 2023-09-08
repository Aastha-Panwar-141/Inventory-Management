class CartsController < ApplicationController
    before_action :set_cart, only: [:show, :update, :destroy]
    
    # GET /carts
    def index
        carts = Cart.all 
        render json: {result: carts}
    end
        
    # GET /carts/:id
    def show
        render json: {result: @cart}
    end
    
    # POST /carts
    def create
        # byebug
        cart = Cart.new(cart_params)
        if cart.save
            render json: {result: 'Product added successfully in cart1!', created_record: cart}, status: 201  #created 
        else
            render json: cart.errors, status: :unprocessable_entity  #422 status code
        end
    end
    
    # PATCH/PUT /carts/1
    def update
        if @cart.update(cart_params)
            render json: {result: 'Cart updated successfully!',updated_record: @cart}
        else
            render json: @cart.errors, status: :unprocessable_entity
        end
    end
    
    # DELETE /carts/1
    def destroy
        @cart.destroy
        render json: {result: 'Product deleted successfully from Cart!', deleted_record: @cart}

    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
        begin
            @cart = Cart.find(params[:id])
          rescue ActiveRecord::RecordNotFound
            render json: {error: 'No record found for given id.'}
          end
    end
    
    # Only allow a trusted parameter "white list" through.
    def cart_params
        params.require(:cart).permit(:customer_id, :product_variant_id)
    end
end
