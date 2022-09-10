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


    validates :title, :rating, presence: true 
    validates :rating, numericality: {in: 1..5}
    validates :body, length: {minimum: 50}

    validate :no_duplicate_review 

    belongs_to :user 
    belongs_to :product
 
    def no_duplicate_review 
        if Review.exists?(user_id: user_id, product_id: product_id)
            errors.add(:base, "You already submitted a review. Thanks!")
        end
    end
end
