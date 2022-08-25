require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end
  describe '投稿の保存' do
    context '投稿できる場合' do
      it 'タイトルと画像と文章、種類とジャンルと公開情報があれば投稿できる' do
        expect(@post).to be_valid
      end
      it '画像が空でも投稿できる' do
        @post.images = nil
        expect(@post).to be_valid
      end
      it '文章が空でも投稿できる' do
        @post.images = nil
        expect(@post).to be_valid
      end
    end
    context 'ツイートが投稿できない場合' do
      it '文章と画像が空では投稿できない' do
        @post.text = ''
        @post.images = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("文章を入力してください")
      end
      it '種類を選択しなくては投稿できない' do
        @post.kind = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("種類を選択してください")
      end
      it 'ジャンルを選択しなくては投稿できない' do
        @post.genre = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("ジャンルを選択してください")
      end
      it '公開設定がないと投稿できない' do
        @post.is_published = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("公開設定は一覧にありません")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end 