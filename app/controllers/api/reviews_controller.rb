class Api::ReviewsController < ApplicationController
    before_action :require_logged_in


    def create
        @review = Review.new(review_params)
        @review.user_id = current_user.id
        if @review.save!
            render :show #save to json database //why not render show? //renderjson = no formatted get apply, render:show, jbuilder format gets applied because show is a jbuilder template
    
        else
            render json: {errors: @review.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        @review = Review.find(params[:id])
        if @review.user_id == current_user.id && @review.update!(review_params)
            (review_params)  && @review
            render :show #customize information about the particular object we're returning, allows us to extract certain info
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
        render :show #send backend(object)-->frontend
    end

    private
    def review_params 
        params.require(:review).permit(:title,:body,:rating,:user_id,:product_id)
    end
    
end
