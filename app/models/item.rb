class Item < ApplicationRecord
  has_one_attached :image
  #  has_one :purchase  は購入機能にて実装をする内容のため
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_fee_payer
  belongs_to :shipping_region
  belongs_to :estimated_delivery
  belongs_to :user

  validates :image, presence: true
  validates :product, presence: true
  validates :product_description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :product_condition_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_payer_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_region_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :estimated_delivery_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
