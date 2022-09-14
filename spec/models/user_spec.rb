require 'rails_helper'

RSpec.describe User, type: :model do
    describe "signup#registration_post" do

     #新規登録/本人情報確認
      it "全ての項目の入力が存在すれば登録できること" do
        user = build(:user)
        expect(user).to be_valid
      end

      # ニックネームが必須であること。
      it "nicknameが空だと登録できない" do
        user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
        user.valid?
        expect(user.errors.full_messages).to include("Nickname can't be blank")
      end
      # メールアドレスが必須であること。
      it "emailが空では登録できない" do
        user = User.new(nickname: "abe", email: "", password: "00000000", password_confirmation: "00000000")
        user.valid?
        expect(user.errors.full_messages).to include("Email can't be blank")
      end
      # メールアドレスが一意性であること。
      it "重複したemailが存在する場合登録できないこと" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid? 
        expect(another_user.errors[:email]).to include("はすでに存在します")
      end
      # メールアドレスは、@を含む必要があること。
      it "emailが@を含まなければ保存できない" do
        user = build(:user, email: "testtest.com")
        user.valid?(:registration_post)
        expect(user.errors[:email]).to include("フォーマットが不適切です")
      end
      # パスワードが必須であること。
      it "passwordが空では保存できない" do
        user = build(:user, password: "")
        user.valid?(:registration_post)
        expect(user.errors[:password]).to include("パスワード を入力してください")
      end
      # パスワードは、6文字以上での入力が必須であること
      it "passwordが6文字以下では保存できない" do
        user = build(:user, password: "pass12")
        user.valid?(:registration_post)
        expect(user.errors[:password]).to include("英字と数字両方を含むパスワードを入力してください")
      end
      # パスワードは、半角英数字混合での入力が必須であること
      it "passwordが数字のみでは登録できない" do
        user = build(:user, password: "1234567890")
        user.valid?(:registration_post)
        expect(user.errors[:password]).to include("英字と数字両方を含むパスワードを入力してください")
      end

      it "passwordが英字のみでは登録できない" do
        user = build(:user, password: "abcdefghij")
        user.valid?(:registration_post)
        expect(user.errors[:password]).to include("英字と数字両方を含むパスワードを入力してください")
      end
      # パスワードとパスワード（確認）は、値の一致が必須であること。
      it "パスワードと確認が一致していないと登録できない" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end
      # お名前(全角)は、名字と名前がそれぞれ必須であること。
      # お名前カナ(全角)は、名字と名前がそれぞれ必須であること。
      it "last_nameがない場合は登録できないこと" do
        user = build(:user, last_name: nil)
        user.valid?
        expect(user.errors[:last_name]).to include("を入力してください")
      end
      it "last_name_kanaがない場合は登録できないこと" do
        user = build(:user, last_name_kana: nil)
        user.valid?
        expect(user.errors[:last_name_kana]).to include("を入力してください")
      end
      it "first_nameがない場合は登録できないこと" do
        user = build(:user, first_name: nil)
        user.valid?
        expect(user.errors[:first_name]).to include("を入力してください")
      end

      it "first_name_kanaがない場合は登録できないこと" do
        user = build(:user, first_name_kana: nil)
        user.valid?
        expect(user.errors[:first_name_kana]).to include("を入力してください")
      end

      # お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。
      it 'last_nameが全角入力でなければ登録できないこと' do
        user = build(:user, last_name: "ｱｲｳｴｵ") 
        user.valid?
        expect(user.errors[:last_name]).to include("は不正な値です")
      end

      it 'first_nameが全角入力でなければ登録できないこと' do
        user = build(:user, first_name: "ｱｲｳｴｵ") 
        user.valid?
        expect(user.errors[:first_name]).to include("は不正な値です")
      end

      # お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。
      it 'last_name_kanaが全角カタカナでなければ登録できないこと' do
        user = build(:user, last_name_kana: "あいうえお") 
        user.valid?
        expect(user.errors[:last_name_kana]).to include("は不正な値です")
      end

      it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
        user = build(:user, first_name_kana: "あいうえお") 
        user.valid?
        expect(user.errors[:first_name_kana]).to include("は不正な値です")
      end

      # 生年月日が必須であること。
      it "birthdayが空では保存できない" do
        user = build(:user, birthday: "")
        user.valid?(:registration_post)
        expect(user.errors[:birthday]).to include("生年月日 を入力してください")
      end


end
