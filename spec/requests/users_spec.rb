require 'rails_helper'
RSpec.describe "Users", type: :request do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it "nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name、first_name_kanaとlast_name_kana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordとpassword_confirmationが6文字以上であれば登録できる" do
        @user.password = '000000'
        @user.password_confirmation = '000000'
      end
      it "first_nameが全角であれば登録できる" do
        @user.first_name = "全角"
        @user.valid?
      end
      it "last_nameが全角であれば登録できる" do
        @user.last_name = "全角"
        @user.valid?
      end
      it "first_name_kanaが全角カタカナであれば登録できる" do
        @user.first_name_kana = "カタカナ"
        @user.valid?
      end
      it "last_name_kanaが全角カタカナであれば登録できる" do
        @user.last_name_kana = "カタカナ"
        @user.valid?
      end
      it "emailには@を含む必要がある" do
        @user.email = '@'
        @user.valid?
      end
    end
    context '新規登録できないとき' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "first_nameが半角では登録できない" do
        @user.first_name = "aiueo"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name には漢字、ひらがな、カタカナを記入してください")
      end
      it "last_nameが半角では登録できない" do
        @user.last_name = "aiueo"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name には漢字、ひらがな、カタカナを記入してください")
      end
      it "first_name_kanaが半角では登録できない" do
        @user.first_name_kana = "aiueo"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana はカタカナのみで入力してください")
      end
      it "last_name_kanaが半角では登録できない" do
        @user.last_name_kana = "aiueo"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana はカタカナのみで入力してください")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "emailには@を含む必要がある" do
        @user.email = 'testtest.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
    end
  end
end
