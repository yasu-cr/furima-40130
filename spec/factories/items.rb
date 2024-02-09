FactoryBot.define do
  factory :item do
    product { '商品名' }
    product_description { '商品説明' }
    category_id { 2 }
    product_condition_id { 2 }
    shipping_fee_payer_id { 2 }
    shipping_region_id { 2 }
    estimated_delivery_id { 2 }
    price { 300 }
    association :user

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
