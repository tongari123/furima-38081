class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


    has_many :purchases
    has_many :items

    validates :nickname,              presence: true
    validates :password,              presence: true, length: { minimum: 6 }
    validates :email,                 presence: true
    validates :first_name,            presence: true, format: { with: /\A[一-龥ぁ-ん]/ }
    validates :family_name,           presence: true, format: { with: /\A[一-龥ぁ-ん]/ }
    validates :first_name_kana,       presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :family_name_kana,      presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday,              presence: true






end




