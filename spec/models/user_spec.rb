require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録できるとき' do
    it 'ユーザー登録できるとき' do
      expect(@user).to be_valid
    end
    it 'メールアドレスが登録できるとき' do
      @user.email = 'sampl@sampl.com'
      expect(@user).to be_valid
    end
    it 'パスワードが登録できるとき' do
      @user.password = '1234asdf'
      @user.password_confirmation = '1234asdf'
      expect(@user).to be_valid
    end
    it '名前が登録できるとき' do
      @user.first_name = '山田'
      @user.last_name = '隆太郎'
      @user.first_name_kana = 'ヤマダ'
      @user.last_name_kana = 'リクタロウ'
      expect(@user).to be_valid
    end
  end
  describe 'ユーザー新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailの@がないと登録できない' do
      @user.email = 'samplsampl.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456a'
      @user.password_confirmation = '123456b'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが6文字以下では登録できない' do
      @user.password = '0000a'
      @user.password_confirmation = '0000a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが英数字混合でないと登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'お名前のfirst_nameが全角でないとは登録できない' do
      @user.first_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it 'お名前のlast_nameが全角でないとは登録できない' do
      @user.last_name = 'rikutaro'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end
    it 'お名前のfirst_name_kanaが全角でないとは登録できない' do
      @user.first_name_kana = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it 'お名前のlast_name_kanaが全角でないとは登録できない' do
      @user.last_name_kana = 'rikutaro'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end
    it 'お名前のfirst_name_kanaがひらがなだと登録できない' do
      @user.first_name_kana = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it 'お名前のlast_name_kanaがひらがなだと登録できない' do
      @user.last_name_kana = 'rikutaro'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end
    it 'お名前のfirst_nameが空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'お名前のlast_nameが空だと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'お名前のfirst_name_kanaが空だと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'お名前のlast_name_kanaが空だと登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'birthdayが空だと登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
