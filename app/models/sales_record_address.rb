class SalesRecordAddress
  include ActiveModell::Model
  attr.accessor :post_code, :prefectures_id, :city, :address_number, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :post_code, format: {with:/\A[0-9]{3}-[0-9]{4}\z/i}
    validates :prefectures_id, numericaliy: {other_than: 1}
    validates :city
    validates :address_number
    validates :phone_number, format: {with:/\A[0-9]{9}\z/i}
    validates :item_id
    validates :user_id
  end

  def save
    sales_record = SalesRecord.create(item_id: item_id, user_id: user_id)
    Adress.create(post_code: post_code, prefectures_id: prefectures_id, city: city, address_number: address_number, phone_number: phone_number, sales_record_id: sales_record.id)
  end

end