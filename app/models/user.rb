class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  with_options presence: true do
  validates :nickname
  validates :email, uniqueness: true
  validates :up_name
  validates :down_name
  validates :up_name_katakana
  validates :down_name_katakana
  validates :birthday
  validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  end
end
