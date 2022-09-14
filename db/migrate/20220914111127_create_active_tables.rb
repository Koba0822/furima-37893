class CreateActiveTables < ActiveRecord::Migration[6.0]
  def change
    create_table :active_tables do |t|
      t.integer :item_category_id, null: false
      t.integer :item_sales_status_id, null: false
      t.integer :item_shipping_fee_status_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :item_scheduled_delivery_id,null:false
      t.integer :item_price,null: false
      t.timestamps
    end
  end
end
