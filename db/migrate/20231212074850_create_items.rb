class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :product, null: false
      t.text :product_description, null: false
      t.integer :category_id, null: false
      t.integer :product_condition_id, null: false
      t.integer :shipping_fee_payer_id, null: false
      t.integer :shipping_region_id, null: false
      t.integer :estimated_delivery_id, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
