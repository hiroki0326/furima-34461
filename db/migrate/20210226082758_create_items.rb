class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name,               null: false
      t.text :description,               null: false
      t.integer :category_id,            null: false
      t.integer :delivery_fee_id,        null: false
      t.integer :status_id,              null: false
      t.integer :prefecture_id,          null: false
      t.integer :day_id,                null: false
      t.integer :price,                  null: false
      t.timestamps
      t.references :user, foreign_key: true
    end
  end
end
