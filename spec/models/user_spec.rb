require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it '新規登録できる場合' do
      it "nicknameとemail,passwordとpassword_confirmationが存在するとき" do
        expect(@user).to be_valid
      end
    end

    it '新規登録できない場合' do
    end
  end
end
