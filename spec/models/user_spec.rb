require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "Should create a new user if all validations pass" do
      @user = User.new(name: "Roberto", email:"don_robert@msn.com", password: "123456", password_confirmation: "123456") 
      @user.valid? 
      expect(@user.errors.full_messages).not_to include("can\'t be blank")
    end

    it "Should fail to create a user if password and password_confirmation don't match" do
      @user = User.new(password: "123456", password_confirmation: "123457") 
      @user.valid? 
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "Should fail to create a user if email is not unique and it should not be case sensitive" do
      @user = User.new(name: "Roberto", email:"don_robert@msn.com", password: "123456", password_confirmation: "123456") 
      @user.save
      @user2 = User.new(name: "Roberto", email:"DON_robert@msn.com", password: "123456", password_confirmation: "123456") 
      @user2.valid?
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it "Should fail to create a user if password is < 6 characters" do
      @user = User.new(name: "Roberto", email:"don_robert@msn.com", password: "12345", password_confirmation: "123456") 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should log the user in if the credentials are correct' do
      @user = User.new(name: "Roberto", email:"don_robert@msn.com", password: "123456", password_confirmation: "123456") 
      @user.save
      expect(User.authenticate_with_credentials("don_robert@msn.com", "123456")).to be_present
    end

    it 'should not authentica the user if the email is incorrect' do
      @user = User.new(name: "Roberto", email:"don_robert@msn.com", password: "123456", password_confirmation: "123456") 
      @user.save
      expect(User.authenticate_with_credentials("donny_robert@msn.com", "123456")).not_to be_present
    end

    it 'should not authenticate the user if the password is incorrect' do
      @user = User.new(name: "Roberto", email:"don_robert@msn.com", password: "123456", password_confirmation: "123456") 
      @user.save
      expect(User.authenticate_with_credentials("don_robert@msn.com", "ABCDEFG")).not_to be_present
    end

    it 'should log the authenticate the user if the email contains spaces' do
      @user = User.new(name: "Roberto", email:"don_robert@msn.com", password: "123456", password_confirmation: "123456") 
      @user.save
      expect(User.authenticate_with_credentials("  don_robert@msn.com   ", "123456")).to be_present
    end

    it 'should authenticate the user if the email is typed with a different case' do
      @user = User.new(name: "Roberto", email:"don_robert@msn.com", password: "123456", password_confirmation: "123456") 
      @user.save
      expect(User.authenticate_with_credentials("  DON_robert@msn.com   ", "123456")).to be_present
    end

  end
end
