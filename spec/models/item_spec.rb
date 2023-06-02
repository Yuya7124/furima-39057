require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品情報の投稿' do
    context '商品出品投稿できる場合' do
      it "product_name,image,explanation,category_id,condition_id,
      delivery_type_id,prefecture_id,shipment_date_id,costが存在するとき" do
        expect(@item).to be_valid
      end
    end

    context '商品出品投稿できない場合' do
      # 商品情報
      it "product_nameが空なとき" do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it "imageが空なとき" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "explanationが空なとき" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it "category_idが0（空である）のとき" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      
      it "condition_idが0（空である）のとき" do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      
      # 発送情報
      it "delivery_type_idが0（空である）のとき" do
        @item.delivery_type_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery type can't be blank")
      end

      it "prefecture_idが0（空である）のとき" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "shipment_date_idが0（空である）のとき" do
        @item.shipment_date_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment date can't be blank")
      end
      
      # 価格情報
      it "costが空のとき" do
        @item.cost = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end

      it "costが300未満のとき" do
        @item.cost = rand(0..299)
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost must be greater than or equal to 300")
      end

      it "costが9,999,999より大きいとき" do
        @item.cost = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost must be less than 10000000")
      end

      # 外部情報
      it "userが紐付いていないとき" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end