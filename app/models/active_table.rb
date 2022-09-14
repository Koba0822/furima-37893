class ActiveTable < ApplicationRecord
  belongs_to :item

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :prefecture_id
    validates :item_status_id
    validates :shipping_cost_id
    validates :shipping_date_id
  end
end
