json.extract! product, 
  :id, 
  :name,
  :category, 
  :price, 
  :desc
# json.id product.id
# json.name product.name
json.photo_url product.photo.url

