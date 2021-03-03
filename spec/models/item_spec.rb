require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context "商品が保存できる場合" do
      it "画像と商品名と商品説明とカテゴリーと配送料と商品状態と配送元と配送日数と価格の記入があれば保存できる" do
        expect(@item).to be_valid
      end
      it "販売価格が¥300~9999999の間の時保存できる" do
        @item.price = 500
        expect(@item).to be_valid
      end
      it "販売価格が半角数字の時保存できる" do
        @item.price = 500
        expect(@item).to be_valid
      end
    end
    context "商品が保存できない場合" do
      it "画像が空では保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end     
      it "商品名が空では保存できない" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end 
      it "商品説明が空では保存できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end 
      it "カテゴリーが空では保存できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank", "Category is not a number"
      end 
      it "カテゴリーのidに1が選択されている場合は出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end 
      it "配送料が空では保存できない" do
        @item.delivery_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee can't be blank", "Delivery fee is not a number"
      end 
      it "配送料のidに1が選択されている場合は出品できない" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee must be other than 1"
      end 
      it "商品状態が空では保存できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank", "Status is not a number"
      end 
      it "商品状態のidに1が選択されている場合は出品できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status must be other than 1"
      end 
      it "発送元が空では保存できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank", "Prefecture is not a number"
      end 
      it "発送元のidに1が選択されている場合は出品できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
      end 
      it "発送日が空では保存できない" do
        @item.day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Day can't be blank", "Day is not a number"
      end 
      it "発送日のidに1が選択されている場合は出品できない" do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Day must be other than 1"
      end 
      it "価格が空では保存できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it "販売価格が¥299以下であると保存できない" do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end 
      it "販売価格が¥9999999以上であると保存できない" do
        @item.price = 99999999
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end 
      it "販売価格が半角数字でないと保存できない" do
        @item.price = "９００"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end 
      it "商品価格が半角英数字混合では出品できない" do
        @item.price = "1a1a"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end 
      it "商品価格が半角英字のみでは出品できない" do
        @item.price = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end 
      it "ユーザーが紐付いていなければ保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
end