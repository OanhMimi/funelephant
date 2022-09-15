json.extract! @cart_item, :id, :quantity, :user_id, :product_id
json.product_name @cart_item.product.name
# json.product_image @cart_item.product.photo.url
json.photo_url @cart_item.product.photos.map { |product| product.url}
json.product_price @cart_item.product.price
