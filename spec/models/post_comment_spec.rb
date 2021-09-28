require 'rails_helper'

RSpec.describe 'PostCommentモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do

    subject { post_comment.valid? }

    let!(:post_comment) { build(:post_comment) }

     context 'commentカラム' do
      it '空欄でないこと' do
        post_comment.comment = ''
        is_expected.to eq false
        expect(post_comment.errors.full_messages).to eq ["Commentを入力してください"]
      end
      it '200文字以下であること: 200文字は〇' do
        post_comment.comment = Faker::Lorem.characters(number: 200)
        is_expected.to eq true
      end
      it '200文字以下であること: 201文字は×' do
        post_comment.comment = Faker::Lorem.characters(number: 201)
        is_expected.to eq false
      end
    end
  end
end