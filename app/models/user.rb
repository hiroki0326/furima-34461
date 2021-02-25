class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
          validates :nickname, presence: true
          validates :email, presence: true, uniqueness: true
          validates :up_name, presence: true
          validates :down_name, presence: true
          validates :up_name_katakana, presence: true
          validates :down_name_katakana, presence: true
          validates :birthday, presence: true
          validates :password, presence: true, length: { minimum: 6 }
end
