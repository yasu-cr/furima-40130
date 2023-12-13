class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_description
  belongs_to :shipping_fee_payer
  belongs_to :shipping_region
  belongs_to :estimated_delivery

  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :product_condition_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_payer_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_region_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :estimated_delivery_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
end
