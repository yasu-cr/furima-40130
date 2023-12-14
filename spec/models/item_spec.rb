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
end