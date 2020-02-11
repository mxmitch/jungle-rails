require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    it "is valid with valid attributes" do
      @category = Category.new
      @product = Product.create(name:"Name", price: nil, quantity: 1, category: @category ) 
      puts @product.errors.full_messages
      expect(@product).to be_valid
    end

    it "is not valid without a name" do
      @category = Category.new
      @product = Product.create(name: nil, price: 2000, quantity: 1, category: @category ) 
      @product.errors.full_messages
      expect(@product).to_not be_valid
    end

    it "is not valid without a price" do
      @category = Category.new
      @product = Product.create(name: "name", price: nil, quantity: 1, category: @category ) 
      @product.errors.full_messages
      expect(@product).to_not be_valid
    end

    it "is not valid without a quantity" do
      @category = Category.new
      @product = Product.create(name: "name", price: 2000, quantity: nil, category: @category ) 
      @product.errors.full_messages
      expect(@product).to_not be_valid
    end

    it "is not valid without a category" do
      @product = Product.create(name: "name", price: 2000, quantity: 1, category: nil ) 
      @product.errors.full_messages
      expect(@product).to_not be_valid
    end
  end
end
