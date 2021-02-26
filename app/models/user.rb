class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  with_options presence: true do
  validates :nickname
  validates :email, uniqueness: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
  validates :up_name
  validates :down_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }do
  validates :up_name_katakana
  validates :down_name_katakana
end
  validates :birthday
  validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  end
end
