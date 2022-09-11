class Api::ProductsController < ApplicationController
    # wrap_parameters include: Product.attribute_names + [:photo], format: :multipart_form

    def index
        @products = Product.all
        render :index
    end

    def show
        @product = Product.find(params[:id])
        render :show
    end
 
end
