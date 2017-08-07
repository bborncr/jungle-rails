require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    it "should create a new product" do
      @category = Category.create name: "Widgets"
      @product = @category.products.create({
        name:  'Widget1',
        description: 'This is a widget',
        image: 'http://www.google.com',
        quantity: 10,
        price: 5000
      })
      expect(@product).to be_valid
    end

    it "should have a name" do
      @category = Category.create name: "Widgets"
      @product = @category.products.create({
        name:  nil,
        description: 'This is a widget',
        image: 'http://www.google.com',
        quantity: 10,
        price: 5000
      })
      expect(@product.errors.messages[:name]).to include("can't be blank")
    end

    it "should have quantity" do
      @category = Category.create name: "Widgets"
      @product = @category.products.create({
        name:  'Widget1',
        description: 'This is a widget',
        image: 'http://www.google.com',
        quantity: nil,
        price: 5000
      })
      expect(@product.errors.messages[:quantity]).to include("can't be blank")
    end

    it "should have a price" do
      @category = Category.create name: "Widgets"
      @product = @category.products.create({
        name:  'Widget1',
        description: 'This is a widget',
        image: 'http://www.google.com',
        quantity: 10,
        price: nil
      })
      # expect(@product).to be_valid
      expect(@product.errors.messages[:price]).to include("can't be blank")
    end
  end
end