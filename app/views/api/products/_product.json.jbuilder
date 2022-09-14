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
# json.photo_url product.photo.url
json.avg_review product.average_rating

