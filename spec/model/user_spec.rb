require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is valid given valid attributes" do
      @user = User.new(name: "name", email: "me@me.com", password: "1234", password_confirmation: "1234") 
      @user.valid?
      @user.errors.full_messages
      expect(@user).to be_valid
    end
    
    it "is not valid without a name" do
      @user = User.new(name: nil, email: "me@me.com", password: "1234", password_confirmation: "1234" ) 
      @user.valid?
      @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it "is not valid without an email" do
      @user = User.new(name: "name", email: nil, password: "1234", password_confirmation: "1234" ) 
      @user.errors.full_messages
      expect(@user).to_not be_valid
    end
    
    it "is not valid without a password" do
      @user = User.new(name: "name", email: "me@me.com", password: nil, password_confirmation: nil ) 
      @user.valid?
      @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it "is not valid if password is under 3 characters" do
      @user = User.new(name: "name", email: "me@me.com", password: "12", password_confirmation: "12")
      @user.valid?
      @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it "is not valid unless password and password_confirmation match" do
      @user = User.new(name: "name", email: "me@me.com", password: "1234", password_confirmation: "1233" ) 
      @user.valid?
      @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it "is not valid if email already exists (case insensitive)" do
      @user1 = User.create(name: "name", email: "me@me.com", password: "1234", password_confirmation: "1234" ) 
      @user2 = User.create(name: "name", email: "ME@me.com", password: "1234", password_confirmation: "1234" ) 
      expect(@user2).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    it "should be valid when given valid attributes" do
      @user = User.create(name:"name", email: "example@domain.com", password:"1234", password_confirmation:"1234")
      expect(User.authenticate_with_credentials("example@domain.com","1234")).to be_present
    end

    it "should be valid when given a email with spaces around it" do
      @user = User.create(name:"name", email: "example@domain.com", password:"1234", password_confirmation:"1234")
      expect(User.authenticate_with_credentials("   example@domain.com  ","1234")).to be_present
    end

    it "should be valid when given a email (case insensitive)" do
      @user = User.create(name:"name", email: "example@domain.com", password:"1234", password_confirmation:"1234")
      expect(User.authenticate_with_credentials("EXAMPLe@DOMAIN.CoM","1234")).to be_present
    end
  end

  describe "#downcase_email" do
    it "makes the email attribute lower case" do
      @user = User.new(name:"name", email: "EXAMPLe@DOMAIN.CoM", password:"1234", password_confirmation:"1234")
      expect{ @user.downcase_email }.to change{ @user.email }.
      from("EXAMPLe@DOMAIN.CoM").
      to("example@domain.com")
    end

    it "downcases an email before saving" do
      @user = User.new(name:"name", email: "EXAMPLe@DOMAIN.CoM", password:"1234", password_confirmation:"1234")
      @user.save!
      expect(@user.email).to eq("example@domain.com")
    end
  end
end
