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
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it 'imageが添付されていないとき' do
      @item.images = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Images can't be blank")
    end
    it 'priceが半角数字以外が含まれるとき' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it 'priceが300未満のとき' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it 'priceが10000000以上のとき' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
    it '商品説明がからでは出品できない' do
      @item.product_description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product description can't be blank")
    end
    it 'userが紐付いていなければ出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
