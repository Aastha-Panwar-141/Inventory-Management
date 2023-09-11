
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :recommended_products]
  
  # GET /users
  def index
    users = User.all 
    render json: {users: users}
  end
  
  # GET /users/:id
  def show
    # render json: {result: @user}, include: ['vendor']
    render json: {result: @user}
  end

  def show_vendor
    vendor = User.where(user_type: 'Vendor')
    render json: vendor
  end

  def show_customer
    customer = User.where(user_type: 'Customer')
    render json: customer
  end

  
  # POST /users
  def create
    # byebug
    user = User.new(user_params)
    if user.save
      render json: {result: 'User created successfully!', created_record: user}, status: 201  #created 
    else
      render json: user.errors, status: :unprocessable_entity  #422 status code
    end
  end
  
  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: {result: 'User updated successfully!',updated_record: @user}, status: 200
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  
  # DELETE /users/1
  def destroy
    @user.destroy
    render json: {result: 'User deleted successfully!', deleted_record: @user}
  end
  
  def recommended_products 
    if @user.present?
      fav_brand = @user.favorite_brand
      recommended_products = Product.where(brand_name: fav_brand)
      render json: {recommended_products: recommended_products}
    else
      render json: {error: "No records."}, status: :bad_request
    end
  end
  
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: {error: 'No record found for given id.'}
    end
  end
  
  
  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :user_type, :favorite_brand)
  end
  
end
