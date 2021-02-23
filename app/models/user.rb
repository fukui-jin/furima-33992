class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_many :items
  # has_many :orders

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

  with_options presence: true do
    validates :nickname
    validates :birthday
    with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'には漢字、ひらがな、カタカナを記入してください' } do
      validates :first_name
      validates :last_name
    end
    with_options presence: true, format: { with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/, message: "はカタカナのみで入力してください"} do
      validates :first_name_kana
      validates :last_name_kana
    end
  end
end
