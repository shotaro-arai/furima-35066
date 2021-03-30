class Item < ApplicationRecord
  
  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :condition_id 
    validates :delivery_fee_id
    validates :prefectures_id
    validates :term_to_send_id 
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999} 
  end
  validates :user, foreign_key: true


  belongs_to :user
end
