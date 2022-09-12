json.product do
    json.partial! 'api/products/product', product: @product
end
 
json.reviews do 
    @product.reviews.each do |review|
        json.set! review.id do
            json.extract! review, :id, :title, :body, :rating, :user_id, :product_id
            json.user_name review.user.first_name 
        end
    end
end