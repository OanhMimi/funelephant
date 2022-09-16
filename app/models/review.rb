# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  body       :text             not null
#  rating     :integer          not null
#  user_id    :bigint           not null
#  product_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Review < ApplicationRecord


    validates :title, :rating, :body, presence: true 
    validates :rating, numericality: {in: 1..5}
    validates :user_id, uniqueness: {scope: :product_id}
      #^ validates a unique pairing between user_id and product_id to ensure 1 user
      #can only create a review for that product
    belongs_to :user 
    belongs_to :product


 

end
