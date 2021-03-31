require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品出品機能' do

    it "全ての項目を過不足なく入力すれば商品出品できる" do
      expect(@item).to be_valid
    end

    it "画像がないと商品出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "商品名がないと商品出品できない" do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    
    it "説明文がないと商品出品できない" do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it "カテゴリーがないと商品出品できない" do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "category_idが1の場合は商品出品できない" do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "商品の状態がないと商品出品できない" do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it "condition_idが1の場合は商品出品できない" do
      @item.condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end

    it "配送料の負担がないと商品出品できない" do
      @item.delivery_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
    end

    it "delivery_fee_idが1の場合は商品出品できない" do
      @item.delivery_fee_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
    end

    it "発送元の地域がないと商品出品できない" do
      @item.prefectures_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefectures can't be blank")
    end

    it "prefectures_idが1の場合は商品出品できない" do
      @item.prefectures_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefectures must be other than 1")
    end

    it "発送までの日数がないと商品出品できない" do
      @item.term_to_send_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Term to send can't be blank")
    end

    it "term_to_send_idが1の場合は商品出品できない" do
      @item.term_to_send_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Term to send must be other than 1")
    end

    it "販売価格がないと商品出品できない" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "販売価格が300円より安いと商品出品できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "販売価格が9,999,999円より高いと商品出品できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it "商品価格が半角英数字混合では商品出品できない" do
      @item.price = '1000yen'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "商品価格が半角英字のみでは商品出品できない" do
      @item.price = 'one hundred dollars'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "商品価格が全角文字では商品出品できない" do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

  end
end
