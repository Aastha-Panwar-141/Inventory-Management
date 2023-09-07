
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :recommended_products]
  
  # GET /users
  def index
    users = User.all 
    render json: users
  end
  
  # GET /users/:id
  def show
    render json: user
  end
  
  # POST /users
  def create
    # byebug
    user = User.new(user_params)
    if user.save
      render json: user, status: 201  #created 
    else
      render json: user.errors, status: :unprocessable_entity  #422 status code
    end
  end
  
  # PATCH/PUT /users/1
  def update
    if user.update(user_params)
      render json: user, status: 200
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end
  
  # DELETE /users/1
  def destroy
    user.destroy
    render json: {msg: 'User deleted successfully!'}
  end
  
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    user = User.find(params[:id])
  end
  
  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :user_type, :favorite_brand)
  end
  
  def recommended_products 
    if user.favorite_brand.present?
      recommended_products = Product.where(brand_name: user.favorite_brand)
      render json: recommended_products
    else
      render json: {error: "No fav brand here."}, status: :bad_request
    end
  end
end
