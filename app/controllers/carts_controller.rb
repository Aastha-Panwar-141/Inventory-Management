class CartsController < ApplicationController
    before_action :set_cart, only: [:show, :update, :destroy]
    
    # GET /carts
    def index
        carts = Cart.all 
        render json: carts
    end
        
    # GET /carts/:id
    def show
        render json: cart
    end
    
    # POST /carts
    def create
        # byebug
        cart = Cart.new(cart_params)
        if cart.save
            render json: cart, status: 201  #created 
        else
            render json: cart.errors, status: :unprocessable_entity  #422 status code
        end
    end
    
    # PATCH/PUT /carts/1
    def update
        if cart.update(cart_params)
            render json: cart
        else
            render json: cart.errors, status: :unprocessable_entity
        end
    end
    
    # DELETE /carts/1
    def destroy
        cart.destroy
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
        cart = Cart.find(params[:id])
    end
    
    # Only allow a trusted parameter "white list" through.
    def cart_params
        params.require(:cart).permit(:customer_id, :product_variant_id)
    end
end
