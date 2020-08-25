require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'last_nameとfirst_name、last_name_readingとfirst_name_reading、birthday、nickname、email、passwordとpassword_confirmationが存在すれば登録できること' do
      expect(@user).to be_valid
    end
    it 'nicknameが空だと登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it '@を含まないemailでは登録できない' do
      @user.email = 'eeeeeegmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空だと登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '1234a'
      @user.password_confirmation = '1234a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが半角英字のみでは登録できない' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password include both letters and numbers')
    end
    it 'passwordが数字だけでは登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password include both letters and numbers')
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_nameが半角では登録できない' do
      @user.last_name = 'ﾃｽﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name full-width characters.')
    end
    it 'first_nameが半角では登録できない' do
      @user.first_name = 'ﾃｽﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name full-width characters.')
    end
    it 'last_name_readingが空では登録できない' do
      @user.last_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name reading can't be blank")
    end
    it 'first_name_readingが空では登録できない' do
      @user.first_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading can't be blank")
    end
    it 'last_name_readingが半角では登録できない' do
      @user.last_name_reading = 'ﾃｽﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name reading full_width characters.')
    end
    it 'first_name_readingが半角では登録できない' do
      @user.first_name_reading = 'ﾃｽﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name reading full_width characters.')
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
