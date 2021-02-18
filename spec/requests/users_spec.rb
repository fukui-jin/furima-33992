require 'rails_helper'
RSpec.describe "Users", type: :request do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name、first_name_kanaとlast_name_kana、birthdayが存在すれば登録できる" do
    end
    it "passwordとpassword_confirmationが6文字以上であれば登録できる" do
    end
    it "first_nameが全角であれば登録できる" do
    end
    it "last_nameが全角であれば登録できる" do
    end
    it "first_name_kanaが全角カタカナであれば登録できる" do
    end
    it "last_name_kanaが全角カタカナであれば登録できる" do
    end
    it "nicknameが空では登録できない" do
    end
    it "emailが空では登録できない" do
    end
    it "passwordが空では登録できない" do
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
    end
    it "passwordが5文字以下では登録できない" do
    end
    it "重複したemailが存在する場合登録できない" do
    end
    it "first_nameが空では登録できない" do
    end
    it "last_nameが空では登録できない" do
    end
    it "first_name_kanaが空では登録できない" do
    end
    it "last_name_kanaが空では登録できない" do
    end
    it "first_nameが半角では登録できない" do
    end
    it "last_nameが半角では登録できない" do
    end
    it "first_name_kanaが半角では登録できない" do
    end
    it "last_name_kanaが半角では登録できない" do
    end
  end
end
