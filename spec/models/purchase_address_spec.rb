require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  context '購入情報が保存できないとき' do
    it '郵便番号が必須であること' do
      @purchase_address.postal_code = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号が正しい形式でないと保存できないこと' do
      @purchase_address.postal_code = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it '都道府県が1だと保存できないこと' do
      @purchase_address.shipping_region_id = 1
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
    end
    it '市区町村が必須であること' do
      @purchase_address.city = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
    end
    it '番地が必須であること' do
      @purchase_address.city = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
    end
    it '電話番号が必須であること' do
      @purchase_address.telephone_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Telephone number can't be blank")
    end
    it '電話番号が正しい形式でないと保存できないこと' do
      @purchase_address.postal_code = '090-1234-5678'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
      @purchase_address.postal_code = '090123456789'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end
