require 'rails_helper'

RSpec.describe 'postモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { post.valid? }

    let!(:post) { build(:post) }

    context 'titleカラム' do
      it '空欄でないこと' do
        post.title = ''
        is_expected.to eq false
        expect(post.errors.full_messages).to eq ["Titleを入力してください"]
      end
    end

    context 'reviewカラム' do
      it '空欄でないこと' do
        post.review = ''
        is_expected.to eq false
        expect(post.errors.full_messages).to eq ["Reviewを入力してください"]
      end

      it '200文字以下であること: 200文字は〇' do
        post.review = Faker::Lorem.characters(number: 200)
        is_expected.to eq true
      end
      it '200文字以下であること: 201文字は×' do
        post.review = Faker::Lorem.characters(number: 201)
        is_expected.to eq false
      end
    end

  end
end