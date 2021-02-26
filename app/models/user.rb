class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  with_options presence: true do
  validates :nickname
  validates :email, uniqueness: true
  validates :up_name, format: { with: /\A[ぁ-んァ-ヶ一-龥]+\z/ }
  validates :down_name, format: { with: /\A[ぁ-んァ-ヶ一-龥]+\z/ }
  validates :up_name_katakana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :down_name_katakana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday
  validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  end
end
