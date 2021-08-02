require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報の保存' do
    context '商品情報が投稿できる場合' do
      it '商品情報を投稿できる' do
        expect(@item).to be_valid
      end
    end

  end
end
