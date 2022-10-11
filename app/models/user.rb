class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :purchases
  has_many :items

  validates :nickname,              presence: true
  validates :first_name,            presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/ }
  validates :family_name,           presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/ }
  validates :first_name_kana,       presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :family_name_kana,      presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday,              presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
end
