
@cart_items.each do |cart_item|
    json.set! cart_item.id do 
        json.extract! cart_item, :id, :quantity, :product_id, :user_id
        json.product_name cart_item.product.name
        json.product_price cart_item.product.price
        json.product_image cart_item.product.photo.url

    end
end