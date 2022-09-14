class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :encrypted_password, presence: true, length: { minimum: 7 }
  validates :last_name,  presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana , presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :user_birth_date, presence: true

  has_many :items
  has_many :buy_items
end
