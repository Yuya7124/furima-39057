require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品の購入とお届け先の登録' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '商品の購入とお届け先の登録できる場合' do
      it "token,postal_code,prefecture_id,city,house_number,tel_numberが存在するとき" do
        expect(@order_address).to be_valid
      end
      it "building_nameが空なとき" do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品の購入とお届け先の登録できない場合' do
      #クレジット情報
      it "tokenが空なとき" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      #お届け先情報
      it "postal_codeが空なとき" do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it "postal_codeが3桁ハイフン4桁でないとき" do
        @order_address.postal_code = '00-000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end

      it "postal_codeがハイフン区切りされていないとき" do
        @order_address.postal_code = '0000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end

      it "postal_codeが半角文字以外のとき" do
        @order_address.postal_code = '０００－００００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end

      it "prefecture_idが0（空である）のとき" do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "cityが空なとき" do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it "house_numberが空なとき" do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it "tel_numberが空なとき" do
        @order_address.tel_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number can't be blank")
      end

      it "tel_numberが10桁以上11桁以内に収まっていないとき" do
        @order_address.tel_number = '09012345678899'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number is invalid")
      end

      it "tel_numberがハイフン区切りされているとき" do
        @order_address.tel_number = Faker::PhoneNumber.phone_number
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number is invalid")
      end

      it "tel_numberが半角数字以外のとき" do
        @order_address.tel_number = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number is invalid")
      end

      #外部情報
      it "userが紐付いていないとき" do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it "itemが紐付いていないとき" do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end