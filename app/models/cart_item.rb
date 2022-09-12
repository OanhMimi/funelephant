class CartItem < ApplicationRecord
    validates :quantity, presence: true, numericality: {in: 1..10}
    validates :user_id, :product_id, presence: true 
    
    belongs_to :user
    belongs_to :product 
end
