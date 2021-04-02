class SalesRecordsController < ApplicationController

  def index
    @sales_record_address = SalesRecordAddress.new
  end

  def create
    @sales_record_address = SalesRecordAddress.new(sales_record_address_params)
    if @sales_record_address.valid?
      @sales_record_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def sales_record_address_params
    params.require(:sales_record_address).permit(:post_code, :prefectures_id, :city, :address_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
