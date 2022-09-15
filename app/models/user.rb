class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  has_many :items
  #has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'Include both letters and numbers'}
    validates :nickname, presence: true
    validates :last_name,  presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_kana , presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :user_birth_date, presence: true
  end
end
