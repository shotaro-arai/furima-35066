class SalesRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_action

  def index
    @sales_record_address = SalesRecordAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @sales_record_address = SalesRecordAddress.new(sales_record_address_params)
    if @sales_record_address.valid?
      @sales_record_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render 'index'
    end
  end

  private

  def sales_record_address_params
    params.require(:sales_record_address).permit(:post_code, :prefectures_id, :city, :address_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_action
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || user_signed_in? && @item.sales_record.present?
      redirect_to root_path
    end
  end
end