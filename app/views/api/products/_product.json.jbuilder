json.extract! product, 
  :id, 
  :name,
  :category, 
  :price, 
  :desc,
  :usage,
  :ingredients
# json.id product.id
# json.name product.name
json.photo_url product.photo.url
# json.photoUrls @product.photos.map { |photo| url_for(photo) }
json.avg_review product.average_rating

