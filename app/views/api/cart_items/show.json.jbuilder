json.extract! @cart_item, :id, :quantity, :user_id, :product_id
json.product_name @cart_item.product.name