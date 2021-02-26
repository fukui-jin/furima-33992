require 'rails_helper'

RSpec.describe OrderBuyer, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_buyer = FactoryBot.build(:order_buyer, user_id: user.id, item_id: item.id)
    sleep 0.3
  end

  describe '商品の購入' do
    context '商品を購入できるとき' do
      it '入力するところが全てが適切に存在すれば購入できる' do
        expect(@order_buyer).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @order_buyer.building_name = ''
        expect(@order_buyer).to be_valid
      end
      it 'phone_numberが11桁以内だと登録できる' do
        @order_buyer.phone_number = '09012345678'
        expect(@order_buyer).to be_valid
      end
    end
    context '商品を購入できないとき' do
      it 'postal_codeが空では保存できない' do
        @order_buyer.postal_code = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefectures_idが「---」では保存できない' do
        @order_buyer.prefectures_id = 0
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Prefectures can't be blank")
      end
      it 'cityが空では保存できない' do
        @order_buyer.city = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では保存できない' do
        @order_buyer.address = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @order_buyer.phone_number = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_buyer.postal_code = '1234567'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'phone_numberが12桁以上では登録できない' do
        @order_buyer.phone_number = '123456789101'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが英数字混合では存在できない' do
        @order_buyer.phone_number = '1234567test'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空では登録できないこと' do
        @order_buyer.token = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では登録できないこと' do
        @order_buyer.user_id = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では登録できないこと' do
        @order_buyer.item_id = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
