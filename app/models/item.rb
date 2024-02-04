class Item < ApplicationRecord
  has_many_attached :images
  has_one :purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_fee_payer
  belongs_to :shipping_region
  belongs_to :estimated_delivery
  belongs_to :user

  validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }
  validates :product, presence: true
  validates :product_description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :product_condition_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_payer_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_region_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :estimated_delivery_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
