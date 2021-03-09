require 'rails_helper'

RSpec.describe Buy, type: :model do
before do
  @user = FactoryBot.create(:user)
  @item = FactoryBot.create(:item)
  @buy = FactoryBot.build(:buy, user_id: @user.id, item_id: @item.id )
  sleep 0.5
end

describe '購入機能' do
  context "購入できる場合" do
    it "支払い情報と郵便番号と都道府県と市区町村と番地と電話番号の記入があれば購入できる" do
      expect(@buy).to be_valid
    end
    it "建物の記入が無くとも購入できる" do
      @buy.building_name = ""
      expect(@buy).to be_valid
    end
    it 'phone_numberが11文字以下であれば登録できる' do
      @buy.phone_number = 22222222222
      expect(@buy).to be_valid
    end
  end
  context "購入できない場合" do
    it "支払い情報が空では購入できない" do
      @buy.token = ""
      @buy.valid?
      expect(@buy.errors.full_messages).to include "Token can't be blank"
    end     
    it "郵便番号が空では購入できない" do
      @buy.postal_code = ""
      @buy.valid?
      expect(@buy.errors.full_messages).to include "Postal code can't be blank"
    end
    it "郵便番号にハイフンが含まれていないと購入できない" do
      @buy.postal_code = "1234567"
      @buy.valid?
      expect(@buy.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
    end
    it "都道府県が空では購入できない" do
      @buy.prefecture_id = ""
      @buy.valid?
      expect(@buy.errors.full_messages).to include "Prefecture can't be blank", "Prefecture is not a number"
    end 
    it "都道府県のidに1が選択されている場合は出品できない" do
      @buy.prefecture_id = 1
      @buy.valid?
      expect(@buy.errors.full_messages).to include "Prefecture must be other than 1"
    end 
    it "市区町村が空では購入できない" do
      @buy.municipalities = ""
      @buy.valid?
      expect(@buy.errors.full_messages).to include "Municipalities can't be blank"
    end 
    it "番地が空では購入できない" do
      @buy.address = ""
      @buy.valid?
      expect(@buy.errors.full_messages).to include "Address can't be blank"
    end 
    it "電話番号が空では購入できない" do
      @buy.phone_number = ""
      @buy.valid?
      expect(@buy.errors.full_messages).to include "Phone number can't be blank"
    end 
    it "電話番号が12文字以上では購入できない" do
      @buy.phone_number = "111111111111"
      @buy.valid?
      expect(@buy.errors.full_messages).to include "Phone number is too long (maximum is 11 characters)"
    end
    it "user_idが空では購入できない" do
      @buy.user_id = ""
      @buy.valid?
      expect(@buy.errors.full_messages).to include "User can't be blank"
    end 
    it "item_idが空では購入できない" do
      @buy.item_id = ""
      @buy.valid?
      expect(@buy.errors.full_messages).to include "Item can't be blank"
    end 
  end
end
end