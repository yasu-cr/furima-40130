FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    shipping_region_id { 2 }
    city { '横浜' }
    street_address { '１-１' }
    building_name { '柳ビル１０３' }
    telephone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}

  end
end
