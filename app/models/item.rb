class Item < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    with_options numericality: {other_than: 1} do
      validates :category_id
      validates :condition_id 
      validates :delivery_fee_id
      validates :prefectures_id
      validates :term_to_send_id
    end
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999} 
  end

  belongs_to :user
  has_one_attached :image
  has_one :sales_record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefectures
  belongs_to :term_to_send

  
  def self.search(keyword)
    if keyword != ""
      Item.where('name LIKE(?)', "%#{keyword}%").order("created_at DESC")
    else
      Item.all.order("created_at DESC")
    end
  end

  def self.sort(keyword,sort)
    items = Item.where('name LIKE(?)', "%#{keyword}%")
    case sort
      when "new"
        items.order("created_at DESC")
      when "old"
        items.order("created_at ASC")
      when "low"
        items.order("price ASC")
      when "expensive"
        items.order("price DESC")
    end
  end
end
