json.extract! @review, :id, :title, :body, :rating, :user_id, :product_id
json.user_name @review.user.first_name 