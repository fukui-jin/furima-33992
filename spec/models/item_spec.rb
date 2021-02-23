require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "出品する時" do
    context '出品登録できるとき' do
      it "必須項目が全て記入されていれば出品できる" do
        expect(@item).to be_valid
      end
    end
    context '出品できないとき' do
      it 'titleが空では出品できない'do
      @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'imageがからでは出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'categoryで---が選択されていると出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'categoryが選択されていないと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it 'item_conditionで---が選択されていると出品できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition must be other than 1")
      end
      it 'item_conditionが選択されていないと出品できない' do
        @item.item_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition is not a number")
      end
      it 'delivery_priceで---選択されていると出品できない' do
        @item.delivery_price_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery price must be other than 1")
      end
      it 'delivery_priceが選択されていないと出品できない' do
        @item.delivery_price_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery price is not a number")
      end
      it 'prefecturesで---選択されていると出品できない' do
        @item.prefectures_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures must be other than 0")
      end
      it 'prefecturesが選択されていないと出品できない' do
        @item.prefectures_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures is not a number")
      end
      it 'delivery_timeで---が選択されてると出品できない' do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time must be other than 1")
      end
      it 'delivery_timeが選択されていないと出品できない' do
        @item.delivery_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time is not a number")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number")
      end
      it '299円以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '10000000円以下では登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '全角数字では登録できない' do
        @item.price = '２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '半角英数混合では登録できない' do
        @item.price = '1b2a'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '半角英語では登録できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
