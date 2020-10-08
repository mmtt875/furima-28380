require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    seller = FactoryBot.create(:user)
    buyer = FactoryBot.create(:user)
    item = FactoryBot.build(:item, user_id: seller.id)
    item.image = fixture_file_upload("app/assets/images/usagi.jpg")
    item.save
    @order = FactoryBot.build(:order, item_id: item.id, user_id: buyer.id)
  end
  describe '商品の購入' do
    context '商品の購入がうまくいくとき' do
      it "全ての項目が正しく入力されていると商品が購入できる" do
      end
      it "" do
      end
    end
    context '商品の購入がうまくいかないとき' do
      it "" do
      end
      it "" do
      end
      it "" do
      end
    end
  end
end
