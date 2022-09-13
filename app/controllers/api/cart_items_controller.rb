class Api::CartItemsController < ApplicationController

    before_action :require_logged_in

    def index 
        @cart_items = current_user.cart_items
        render :index
    end 

    def create
        current_user.cart_items.each do |cart_item|
            if (cart_item.product_id == params[:cart_item][:product_id].to_i)
                cart_item.quantity += 1 
                cart_item.save
                @cart_item = cart_item
                return 
            end
        end

        @cart_item = CartItem.new(cart_item_params) #pass in cart_item_params to create a cart_item
        # @cart_item.user_id = current_user.id    #make the user_id in cart_item equal to the current_user id
        @cart_item.quantity = 1 
        if @cart_item.save
            render :show  
        else
            render json: {errors: @review.errors.full_messages}, status: :unprocessable_entity #when you render error, you want to render it in json
        end
    end


    def update
        @cart_item = CartItem.find(params[:id])
        if @cart_item && @cart_item.update(cart_item_params)
            render :show
        else
            render json: { message: "Cannot update cart"}, status: :unauthorized
        end
    end

    def destroy 
        @cart_item = CartItem.find(params[:id])
        if @cart_item && @cart_item.destroy
            render :show 
        end
    end

    private
    def cart_item_params
        params.require(:cart_item).permit(:user_id, :product_id)
    end
end
