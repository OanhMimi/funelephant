class Api::ProductsController < ApplicationController
    wrap_parameters include: Product.attribute_names + [:photo], format: :multipart_form

    def index
        @products = Product.all
    end

    def show
        @product = Product.find(params[:id])
    end

    private
    def product_params
        params.require(:product).permit(
            :name,
            :category,
            :price,
            :desc
        )
    end

    
end
