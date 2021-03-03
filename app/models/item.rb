class Item < ApplicationRecord

  with_options presence: true do
    validates :item_name
    validates :description
    validates :image
      with_options numericality: { other_than: 1 } do
        validates :category_id
        validates :delivery_fee_id
        validates :status_id
        validates :prefecture_id
        validates :days_id
      end
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/ }
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :day
end
