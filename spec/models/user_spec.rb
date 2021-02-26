require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname,email、passwordとpassword_confirmation、up_name、down_name、up_name_katakana、down_name_katakana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.nickname = '000000'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@がなければ登録できない' do
        @user.email = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '000a0'
        @user.password_confirmation = '000a0'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it '半角英数字混合での入力がなければ登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'up_nameが空では登録できない' do
        @user.up_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Up name can't be blank"
      end
      it 'down_nameが空では登録できない' do
        @user.down_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Down name can't be blank"
      end
      it 'up_name_katakanaが空では登録できない' do
        @user.up_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Up name katakana can't be blank"
      end
      it 'down_name_katakanaが空では登録できない' do
        @user.down_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Down name katakana can't be blank"
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
