require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_delivery = FactoryBot.build(:order_delivery, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_delivery).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_delivery.building_name = ''
        expect(@order_delivery).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_delivery.postal_code = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_delivery.postal_code = '1234567'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Postal code is invalid')
      end
      it 'source_idを選択していないと保存できないこと' do
        @order_delivery.source_id = 0
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Source Select')
      end
      it 'cityが空だと保存できないこと' do
        @order_delivery.city = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @order_delivery.house_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_delivery.phone_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が9桁以下だと登録できないこと' do
        @order_delivery.phone_number = '090123456'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上だと登録できないこと' do
        @order_delivery.phone_number = '090123456789'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが英数混合では保存できないこと' do
        @order_delivery.phone_number = '0901234abcd'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空だと保存できないこと' do
        @order_delivery.token = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが空だと保存できないこと' do
        @order_delivery.user_id = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが空だと保存できないこと' do
        @order_delivery.item_id = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
