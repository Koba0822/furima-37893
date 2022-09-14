class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :buy_item
  has_one_attached :image

  with_options presence: true do
    validates :user_id
    validates :item_image
    validates :item_name
    validates :item_info
    validates :item_category_id
    validates :item_status_id
    validates :item_shipping_cost_id
    validates :prefecture_id
    validates :item_shipping_date_id
    # 300円以上かつ9,999,999円以下で、半角数字でないと入力不可
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  # ジャンルの選択が「--」の時は保存不可
  with_options numericality: { other_than: 0 } do
    validates :item_category_id
    validates :prefecture_id
    validates :item_status_id
    validates :item_shipping_cost_id
    validates :item_shipping_date_id      
  end
end
