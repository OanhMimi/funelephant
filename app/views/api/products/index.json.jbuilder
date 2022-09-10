# json.products({})

json.set! :products do
  @products.each do |product|
    json.set! product.id do
      json.partial! 'api/products/product', product: product
      json.num_reviews product.reviews.length
      json.avg_review product.average_rating
    end
  end
end

#jbuilder is a way of creating an object/template of how an object should look
#set is the same as setting a key
#everthing inside a do is the value within that object(key)

