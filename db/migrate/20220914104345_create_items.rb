class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,              null: false, foreign_key: true           
      t.string     :item_name,             null: false 
      t.text       :item_info,         null: false
      t.integer    :item_category_id,       null: false
      t.integer    :item_status_id,    null: false
      t.integer    :item_shipping_cost_id,  null: false
      t.integer    :prefecture_id,     null: false
      t.integer    :item_shipping_date_id,  null: false
      t.integer    :item_price,             null: false
      t.timestamps
    end
  end
end
