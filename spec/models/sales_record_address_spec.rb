require 'rails_helper'

RSpec.describe SalesRecordAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @sales_record_address = FactoryBot.build(:sales_record_address,user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context "内容に問題がない場合" do

      it "全ての値が正しく入力されていて、トークンがあれば商品購入できる" do
        expect(@sales_record_address).to be_valid
        sleep(1)
      end

      it "建物名はなくても商品購入できる" do
        @sales_record_address.building = ''
        expect(@sales_record_address).to be_valid
        sleep(1)
      end
    end

    context "内容に問題がある場合" do
    
      it "郵便番号の値がないと商品購入できない" do
        @sales_record_address.post_code = ''
        @sales_record_address.valid?
        expect(@sales_record_address.errors.full_messages).to include("Post code can't be blank")
        sleep(1)
      end

      it "郵便番号にハイフン-がないと商品購入できない" do
        @sales_record_address.post_code = '1234567'
        @sales_record_address.valid?
        expect(@sales_record_address.errors.full_messages).to include("Post code is invalid")
        sleep(1)
      end

      it "都道府県の値がないと商品購入できない" do
        @sales_record_address.prefectures_id = ''
        @sales_record_address.valid?
        expect(@sales_record_address.errors.full_messages).to include("Prefectures can't be blank")
        sleep(1)
      end

      it "都道府県の値が1の場合は商品購入できない" do
        @sales_record_address.prefectures_id = 1
        @sales_record_address.valid?
        expect(@sales_record_address.errors.full_messages).to include("Prefectures must be other than 1")
        sleep(1)
      end

      it "市区町村の値がないと商品購入できない" do
        @sales_record_address.city = ''
        @sales_record_address.valid?
        expect(@sales_record_address.errors.full_messages).to include("City can't be blank")
        sleep(1)
      end

      it "番地の値がないと商品購入できない" do
        @sales_record_address.address_number = ''
        @sales_record_address.valid?
        expect(@sales_record_address.errors.full_messages).to include("Address number can't be blank")
        sleep(1)
      end

      it "電話番号の値がないと商品購入できない" do
        @sales_record_address.phone_number = ''
        @sales_record_address.valid?
        expect(@sales_record_address.errors.full_messages).to include("Phone number can't be blank")
        sleep(1)
      end

      it "電話番号の値が11桁より多い場合は商品購入できない" do
        @sales_record_address.phone_number = '076432109876'
        @sales_record_address.valid?
        expect(@sales_record_address.errors.full_messages).to include("Phone number is invalid")
        sleep(1)
      end

      it "電話番号の値が英数混合の場合は商品購入できない" do
        @sales_record_address.phone_number = '0764abcdefg'
        @sales_record_address.valid?
        expect(@sales_record_address.errors.full_messages).to include("Phone number is invalid")
        sleep(1)
      end

      it "user_idがないと商品購入できない" do
        @sales_record_address.user_id = ''
        @sales_record_address.valid?
        expect(@sales_record_address.errors.full_messages).to include("User can't be blank")
        sleep(1)
      end

      it "item_idがないと商品購入できない" do
        @sales_record_address.item_id = ''
        @sales_record_address.valid?
        expect(@sales_record_address.errors.full_messages).to include("Item can't be blank")
        sleep(1)
      end

      it "tokenの値が空の場合は商品購入できない" do
        @sales_record_address.token = nil
        @sales_record_address.valid?
        expect(@sales_record_address.errors.full_messages).to include("Token can't be blank")
        sleep(1)
      end
    end
  end
end
