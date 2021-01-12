require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "Should create a new product if all validations pass" do
      @category = Category.new(name: "test_cat")
      @product = Product.new(name: "Stinky Blue Cheese Chair", price_cents: "12000", quantity: 7, category: @category) 
      @product.valid? 
      expect(@product.errors).not_to include("can\'t be blank")
    end 
    it "Should fail to create a product if name is missing" do
      @category = Category.new(name: "test_cat")
      @product = Product.new(price_cents: "12000", quantity: 7, category: @category) 
      @product.valid? 
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end 
    it "Should fail to create a product if quantity is missing" do
      @category = Category.new(name: "test_cat")
      @product = Product.new(name: "Stinky Blue Cheese Chair", price_cents: "12000", category: @category)  
      @product.valid? 
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end 
    it "Should fail to create a product if price is missing" do
      @category = Category.new(name: "test_cat")
      @product = Product.new(name: "Stinky Blue Cheese Chair", quantity: 7, category: @category) 
      @product.valid? 
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end 
    it "Should fail to create a product if category is missing" do
      @category = Category.new(name: "test_cat")
      @product = Product.new(name: "Stinky Blue Cheese Chair", price_cents: "12000", quantity: 7) 
      @product.valid? 
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end 
  end
end
