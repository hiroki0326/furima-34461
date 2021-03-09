class Buy
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :address, :phone_number, :building_name, :user_id, :item_id, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :municipalities
  validates :address
  validates :phone_number, length: { maximum: 11 }
  validates :token
  validates :item_id
  validates :user_id
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    order = Order.create(user_id: user_id, item_id: item_id)
    Deliver.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end