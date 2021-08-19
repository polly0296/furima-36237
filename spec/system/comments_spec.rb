require 'rails_helper'

RSpec.describe "Comments", type: :system do
  before do
    @item = FactoryBot.create(:item)
    @comment = Faker::Lorem.sentence
  end

  it 'ログインしたユーザーは商品詳細ページでコメント投稿できる' do
    # ログインする
    visit new_user_session_path
    fill_in 'email', with: @item.user.email
    fill_in 'password', with: @item.user.password
    find('input[name="commit"]').click
    expect(current_path).to eq(root_path)
    # ツイート詳細ページに遷移する
    visit item_path(@item)
    # フォームに情報を入力する
    fill_in 'comment_text', with: @comment
    # コメントを送信すると、Commentモデルのカウントが1上がることを確認する
    expect{
      click_button 'コメントする'
      }.to change { Comment.count }.by(1)
    # 詳細ページにリダイレクトされることを確認する
    expect(current_path).to eq(item_path(@item))
    # 詳細ページ上に先ほどのコメント内容が含まれていることを確認する
    expect(page).to have_content @comment
  end
end
