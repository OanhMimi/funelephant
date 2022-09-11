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
    validates :user_id, uniqueness: {scope: :product_id}

    belongs_to :user 
    belongs_to :product


 

end
