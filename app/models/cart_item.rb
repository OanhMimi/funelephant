# == Schema Information
#
# Table name: cart_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer          not null
#  user_id    :bigint           not null
#  product_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CartItem < ApplicationRecord
    validates :quantity, presence: true, numericality: {in: 1..10}
    validates :user_id, :product_id, presence: true 
    
    belongs_to :user
    belongs_to :product 
end
