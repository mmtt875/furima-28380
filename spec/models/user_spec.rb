require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全ての項目が入力されていると登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上で英数字混合であれば登録できる" do
        @user.password = "aaa111"
        @user.password_confirmation = "aaa111"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが重複していると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@が入っていないと登録できない" do
        @user.email ="aaaaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが6文字以下だと登録できない" do
        @user.password = "aa0"
        @user.password_confirmation = "aa0"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが英字のみだと登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwaordが数字のみだと登録できない" do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが存在してもpassword_confirmationが空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "family_nameが空だと登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "family_nameに全角漢字、ひらがな、カタカナ以外が使用されていると登録できない" do
        @user.family_name = "poyo"
        @user.valid?
        #binding.pry
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameに全角漢字、ひらがな、カタカナ以外が使用されていると登録できない" do
        @user.first_name = "poyo"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "family_name_kanaが空だと登録できない" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it "family_name_kanaに全角カタカナ以外が使用されていると登録できない" do
        @user.family_name_kana = "poyo"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "first_name_kanaに全角カタカナ以外が使用されていると登録できない" do
        @user.first_name_kana = "poyo"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
