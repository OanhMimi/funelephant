# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  category   :string           not null
#  desc       :string           not null
#  price      :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Product < ApplicationRecord
    validates :name, uniqueness: true, presence: true 
    validates :category, :price, :desc, presence: true

    has_one_attached :photo 
    # has_many_attached :photos
    has_many :reviews,
    dependent: :destroy

    has_many :cart_items,
    dependent: :destroy
    
    def average_rating
        (self.reviews.pluck(:rating).sum * 1.0)/self.reviews.length
    end
end
