require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is not valid without a password" do
      @user = User.new(name: "name", email: "me@me.com", password: nil, password_confirmation: nil ) 
      @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it "is not valid if password is under 3 characters" do
      @user = User.new(name: "name", email: "me@me.com", password: "12", password_confirmation: "12")
      @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it "is not valid unless password and password_confirmation match" do
      @user = User.new(name: "name", email: "me@me.com", password: "1234", password_confirmation: "1233" ) 
      @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it "is not valid without a name" do
      @user = User.new(name: nil, email: "me@me.com", password: "1234", password_confirmation: "1234" ) 
      @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it "is not valid without an email" do
      @user = User.new(name: "name", email: nil, password: "1234", password_confirmation: "1234" ) 
      @user.errors.full_messages
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it "should be valid when spaces are put around email" do
      @user = User.new(name:"name", email: "  example@domain.com  ", password:"1234", password_confirmation:"1234")
      @user.errors.full_messages
      expect(@user).to be_valid
    end

    it "should be valid when email is upper and lower case" do
      @user = User.new(name:"name", email: "EXAMPLe@DOMAIN.CoM", password:"1234", password_confirmation:"1234")
      @user.errors.full_messages
      expect(@user).to be_valid
    end
  end
end
