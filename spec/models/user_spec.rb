require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nicknameとemail,
      passwordとpassword_confirmation,
      surnameとgiven_name,
      read_surnameとread_given_name,
      birth_dataが存在するとき" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      # 新規登録/ユーザー情報
      it "nicknameが空のとき" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空のとき" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "重複したemailが存在する" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?        
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailに@がないとき" do
        @user.email = 'test`example.com'
        @user.valid?        
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空のとき" do
        @user.password = ''
        @user.valid?        
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが6文字未満のとき" do
        @user.password = 'abc01'
        @user.password_confirmation = @user.password
        @user.valid?        
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが半角英字だけになっているとき" do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?        
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordが半角数字だけになっているとき" do
        @user.password = '000000'
        @user.password_confirmation = @user.password
        @user.valid?        
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordが全角文字が混じっているとき" do
        @user.password = 'ｍpdg25'
        @user.password_confirmation = @user.password
        @user.valid?        
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordとpassword_confirmationが不一致のとき" do
        @user.password = 'abcd000'
        @user.password_confirmation = 'abcd001'
        @user.valid?        
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      # 新規登録/本人情報確認
      it "surnameが空のとき" do
        @user.surname = ''
        @user.valid?        
        expect(@user.errors.full_messages).to include("Surname can't be blank")
      end

      it "surnameが全角（漢字・ひらがな・カタカナ）でないとき" do
        @user.surname = 'TEST'
        @user.valid?        
        expect(@user.errors.full_messages).to include("Surname is invalid")
      end

      it "read_surnameが空のとき" do
        @user.read_surname = ''
        @user.valid?        
        expect(@user.errors.full_messages).to include("Read surname can't be blank")
      end

      it "read_surnameが全角（カタカナ）でないとき" do
        @user.read_surname = 'てすと'
        @user.valid?        
        expect(@user.errors.full_messages).to include("Read surname is invalid")
      end
      
      it "given_nameが空のとき" do
        @user.given_name = ''
        @user.valid?        
        expect(@user.errors.full_messages).to include("Given name can't be blank")
      end
      
      it "given_nameが全角（漢字・ひらがな・カタカナ）でないとき" do
        @user.given_name = 'TEST'
        @user.valid?        
        expect(@user.errors.full_messages).to include("Given name is invalid")
      end

      it "read_given_nameが空のとき" do
        @user.read_given_name = ''
        @user.valid?        
        expect(@user.errors.full_messages).to include("Read given name can't be blank")
      end

      it "read_given_nameが全角（カタカナ）でないとき" do
        @user.read_given_name = 'てすと'
        @user.valid?        
        expect(@user.errors.full_messages).to include("Read given name is invalid")
      end
      
      it "birth_dataが空のとき" do
        @user.birth_data = ''
        @user.valid?        
        expect(@user.errors.full_messages).to include("Birth data can't be blank")
      end
    end
  end
end
