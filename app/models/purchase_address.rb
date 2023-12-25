class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_region_id, :city, :street_address, :building_name, :telephone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :street_address
    validates :telephone_number, format: {with: /\A\d{10,11}\z/, message: "Input only number"}
    validates :user_id
    validates :item_id
    validates :token, presence: true
    
  end
  validates :shipping_region_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
 
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, shipping_region_id: shipping_region_id, city: city, street_address: street_address, building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
  end

end