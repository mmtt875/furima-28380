require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("app/assets/images/usagi.jpg")
  end

  describe '商品出品' do
    context '出品がうまくいくとき' do
      it "全ての項目が入力されていれば出品できる" do
        expect(@item).to be_valid
      end
      it "商品名が40文字以下で登録できる" do
        @item.name = "おまんじゅう"
        expect(@item).to be_valid
      end
      it "商品の説明が1000文字以下で登録できる" do
        @item.description = "ふわふわやわらか"
        expect(@item).to be_valid
      end
    end
    context '出品がうまくいかなとき' do
      it "商品名が空だと出品できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "画像がないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が40文字以上だと出品できない" do
        @item.name = 'ああああああああああああああああああああああああああああああああああああああああああああああああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it "商品の説明が空だと出品できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "商品の説明が1000文字以上だと出品できない" do
        @item.description = 'ああああああああああああああああああああああああああああああああああああああああああああああああああ
        ああああああああああああああああああああああああああああああああああああああああああああああああああ
        ああああああああああああああああああああああああああああああああああああああああああああああああああ
        ああああああああああああああああああああああああああああああああああああああああああああああああああ
        ああああああああああああああああああああああああああああああああああああああああああああああああああ
        ああああああああああああああああああああああああああああああああああああああああああああああああああ
        ああああああああああああああああああああああああああああああああああああああああああああああああああ
        ああああああああああああああああああああああああああああああああああああああああああああああああああ
        ああああああああああああああああああああああああああああああああああああああああああああああああああ
        ああああああああああああああああああああああああああああああああああああああああああああああああああ
        ああああああああああああああああああああああああああああああああああああああああああああああああああ
        ああああああああああああああああああああああああああああああああああああああああああああああああああ
        ああああああああああああああああああああああああああああああああああああああああああああああああああ
        ああああああああああああああああああああああああああああああああああああああああああああああああああ
        ああああああああああああああああああああああああああああああああああああああああああああああああああ
        ああああああああああああああああああああああああああああああああああああああああああああああああああ
        ああああああああああああああああああああああああああああああああああああああああああああああああああ
        ああああああああああああああああああああああああああああああああああああああああああああああああああ
        ああああああああああああああああああああああああああああああああああああああああああああああああああ
        ああああああああああああああああああああああああああああああああああああああああああああああああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Description is too long (maximum is 1000 characters)")
      end
      it "カテゴリーが未選択の状態だと出品できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品の状態が未選択だと出品できない" do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "配送料の負担が未選択だと出品できない" do
        @item.delivery_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it "発送元の地域が未選択だと出品できない" do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end
      it "発送までの日数が未選択だと出品できない" do
        @item.delivery_days_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days must be other than 1")
      end
      it "販売価格が空だと出品できない" do
        @item.price =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "販売価格が半角英数以外だと出品できない" do
        @item.price ='おにぎり'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "販売価格が300円以下だと出品できない" do
        @item.price ='100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      it "販売価格が9999999円以上だと出品できない" do
        @item.price ='100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
    end
  end
end
