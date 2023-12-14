FactoryBot.define do
  factory :item do
    product { '商品名' }
    product_description { '商品説明' }
    category_id { 1 }
    product_condition_id { 1 }
    shipping_fee_payer_id { 1 }
    shipping_region_id { 1 }
    estimated_delivery_id { 1 }
    price { 300 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
