class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX#, message: 'には英字と数字の両方を含めて設定してください' 
  validates :nickname, presence: true
  validates :family_name, presence: true, format:{ with: /\A[ぁ-んァ-ン一-龥]/ }#, message: "全角（漢字・ひらがな・カタカナ）で入力してください"}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }#, message: "全角（漢字・ひらがな・カタカナ）で入力してください"}
  validates :family_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }#, message: "全角カタカナで入力してください"}
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }#, message: "全角カタカナで入力してください"}
  validates :birthday, presence: true
  has_many :items
end
