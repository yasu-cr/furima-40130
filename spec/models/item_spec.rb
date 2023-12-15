require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品登録できるとき' do
    it '商品が登録できるとき' do
      expect(@item).to be_valid
    end
  end

  context '商品登録できないとき' do
    it 'productが空のとき' do
    @item.product = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Product can't be blank")
    end
    it 'category_idが空のとき' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'product_condition_idが空のとき' do
      @item.product_condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Product condition can't be blank")
    end
    it 'shipping_fee_payer_idが空のとき' do
      @item.shipping_fee_payer_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee payer can't be blank")
    end
    it 'shipping_region_idが空のとき' do
      @item.shipping_region_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping region can't be blank")
    end
    it 'estimated_delivery_idが空のとき' do
      @item.estimated_delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Estimated delivery can't be blank")
    end
    it 'priceが空のとき' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'imageが添付されていないとき' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  end
end
