class SalesRecordAddress
  include ActiveModell::Model
  attr.accessor :post_code, :prefectures_id, :city, :address_number, :building, :phone_number, :sales_record_id, :item_id, :user_id

  def save
  end

end