require 'rails_helper'

RSpec.describe "Items", type: :request do

  before do
    @item = FactoryBot.create(:item)
  end

  describe "GET /items" do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get root_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに投稿検索フォームが存在する' do 
      get root_path
      expect(response.body).to include('キーワードから探す')
    end
  end

  describe 'GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get item_path(@item)
      expect(response.status).to eq 200
    end
    it 'showアクションにリクエストするとレスポンスに投稿検索フォームが存在する' do 
      get item_path(@item)
      expect(response.body).to include('キーワードから探す')
    end
  end 
end
