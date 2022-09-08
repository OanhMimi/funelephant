# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  category   :string           not null
#  price      :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Product < ApplicationRecord
    validates :name, uniqueness: true, presence: true 
    validates :category, :price, :desc, presence: true

    has_one_attached :photo 
    
end
