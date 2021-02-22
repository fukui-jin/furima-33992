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
      it 'categoryが---もしくは選択されていないと出品できない' do
        @item.category_id = '1'
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it 'item_conditionが---もしくは選択されていないと出品できない' do
        @item.item_condition_id = '1'
        @item.item_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition is not a number")
      end
      it 'delivery_priceが---もしくは選択されていないと出品できない' do
        @item.delivery_price_id = '1'
        @item.delivery_price_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery price is not a number")
      end
      it 'prefecturesが---もしくは選択されていないと出品できない' do
        @item.prefectures_id = '0'
        @item.prefectures_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures is not a number")
      end
      it 'delivery_timeが---もしくは選択されていないと出品できない' do
        @item.delivery_time_id = '1'
        @item.delivery_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time is not a number")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end
