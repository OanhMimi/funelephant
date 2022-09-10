class Api::ReviewsController < ApplicationController
    before_action :require_logged_in

    def index
        @reviews = Reviews.all 
        render :index 
    end

    def show
        @review = Review.find(params[:id])
        render :show 
    end

    def create
        @review = Review.new(review_params)
        if @review.save
            render json: @review #save to json database //why not render show?
        else
            render json: {errors: @review.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        @review = Review.find(params[:id])
        if @review.user_id == current_user.id && @review.update!(review_params)  && @review
            render json: {review:@review} 
        else 
            render json: { message: "You can only edit your own reviews!"}, status: :unauthorized
        end
    end

    def destroy 
        @review = current_user.reviews.find(params[:id])
        unless @review
            render json: { message: 'Unauthorized' }, status: :unauthorized
            return
        end
        @review.destroy
        render json: @review
    end

    private
    def review_params 
        params.require(:review).permit(:title,:body,:rating,:user_id,:product_id)
    end
    
end
