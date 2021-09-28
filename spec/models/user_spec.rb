require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { user.valid? }
    
    let!(:other_user) { create(:user) }
    let(:user) { build(:user) }

     context 'nameカラム' do
      it '空欄でないこと' do
        user.name = ''
        is_expected.to eq false
        expect(user.errors.full_messages).to eq ["ユーザーネームを入力してください"]
      end
      it '一意性があること' do
        user.name = other_user.name
        is_expected.to eq false
        expect(user.errors.full_messages).to eq ["ユーザーネームはすでに存在します"]
      end
    end
  end
end