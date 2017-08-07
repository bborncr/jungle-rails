require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "should create a new user" do
      @user = User.create email: "joe@example.com", password: "123456", password_confirmation: "123456"
      expect(@user).to be_valid
    end

    it "should create only unique user" do
      @user = User.create email: "joe@example.com", password: "123456", password_confirmation: "123456"
      @second_user = User.create email: "joe@example.com", password: "654321", password_confirmation: "654321"
      expect(@second_user.errors.messages[:email]).to include("has already been taken")
    end

    it "should require a password of minimum 4 characters" do
      @user = User.create email: "joe@example.com", password: "12", password_confirmation: "12"
      expect(@user.errors.messages[:password]).to include("is too short (minimum is 4 characters)")
    end
  end
end
