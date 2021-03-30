require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do

    it "全ての項目を過不足なく入力すれば新規登録できる" do
      expect(@user).to be_valid
    end
    it "nicknameが空だと新規登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空だと新規登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    
    it "emailに@が含まれていないと新規登録できない" do
      @user.email = 'helloworld.mail'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "登録済みのemailだと新規登録できない" do
      @user.save
      @another_user = FactoryBot.build(:user)
      @another_user.email = @user.email
      @another_user.valid?
      expect(@another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordが空だと新規登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが5文字以下だと新規登録できない" do
      @user.password = 'abc12'
      @user.password_confirmation = 'abc12'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが数字のみだと新規登録できない" do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
      
    end

    it "passwordが英語のみだと新規登録できない" do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordが全角では新規登録できない" do
      @user.password = 'イロハニホヘト'
      @user.password_confirmation = 'イロハニホヘト'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "password_confirmationが空だと新規登録できない" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "password_confirmationとpasswordが不一致だと新規登録できない" do
      @user.password_confirmation = 'efg456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "last_nameが空だと新規登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "last_nameが半角だと新規登録できない" do
      @user.last_name = 'arai'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it "first_nameが空だと新規登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "first_nameが半角だと新規登録できない" do
      @user.first_name = 'shotaro'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "last_name_kanaが空だと新規登録できない" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "last_name_kanaが半角だと新規登録できない" do
      @user.last_name_kana = 'ｱﾗｲ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it "last_name_kanaが漢字だと新規登録できない" do
      @user.last_name_kana = '荒井'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it "first_name_kanaが空だと新規登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "first_name_kanaが半角だと新規登録できない" do
      @user.first_name_kana = 'ｼｮｳﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it "first_name_kanaが漢字だと新規登録できない" do
      @user.first_name_kana = '翔太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it "birthdayが空だと登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
