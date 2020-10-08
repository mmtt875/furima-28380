require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    seller = FactoryBot.create(:user)
    buyer = FactoryBot.create(:user)
    item = FactoryBot.build(:item, user_id: seller.id)
    item.image = fixture_file_upload("app/assets/images/usagi.jpg")
    item.save
    @order = FactoryBot.build(:order, item_id: item.id, user_id: buyer.id)
    sleep 1
  end
  describe '商品の購入' do
    context '商品の購入がうまくいくとき' do
      it "全ての項目が正しく入力されていると商品が購入できる" do
        expect(@order).to be_valid
      end
      it "建物名が空でも購入できる" do
        @order.building_name = ""
        expect(@order).to be_valid
      end
    end
    context '商品の購入がうまくいかないとき' do
      it "郵便番号が空だと購入できない" do
        @order.postal_code = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it "郵便番号にハイフンが入っていないと購入できない" do
        @order.postal_code = "0000000"
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end
      it "都道府県が未選択だと購入できない" do
        @order.area_id = "1"
        @order.valid?
        expect(@order.errors.full_messages).to include("Area must be other than 1")
      end
      it "市区町村が空だと購入できない" do
        @order.city = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it "番地が空だと購入できない" do
        @order.address = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空だと購入できない" do
        @order.phone_number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号が半角数字以外だと購入できない" do
        @order.phone_number = "おまんじゅう"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号が11桁以上だと購入できない" do
        @order.phone_number = "000000111111"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it "トークンがないと購入できない" do
        @order.token = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
