class Api::CartItemsController < ApplicationController

    before_action :require_logged_in

    def index 
        @cart_items = CartItem.all 
        render :show
    end 

    def create
        @cart_item = CartItem.new(cart_item_params) #pass in cart_item_params to create a cart_item
        @cart_item.user_id = current_user.id    #make the user_id in cart_item equal to the current_user id
        if @cart_item.save
            render :show  
        else
            render json: {errors: @review.errors.full_messages}, status: :unprocessable_entity #when you render error, you want to render it in json
        end
    end

    def update
        @cart_item = CartItem.find(params[:id])
        if @cart_item && @cart_item.update!(cart_item_params)
            render :show
        else{
            render json: { message: "Cannot update cart"}, status: :unauthorized
        }
    end

    def destroy 
        @cart_item = CartItem.find(params[:id])
        @cart_item.destroy
            render :show 
    end

    private
    def cart_item_params
        params.require(:cart_item).permit(:quantity, :user_id, :product_id)
    end
end
