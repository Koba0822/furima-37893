## users table
| Column                         | Type                | Options                   |
|--------------------------------|---------------------|---------------------------|
|nickname                        | string              | null: false               |
|email                           | string              | null: false, unique: true |
|encrypted_password              | string              | null: false               |
|last_name                       | string              | null: false               |
|first_name                      | string              | null: false               |
|last_name_kana                  | string              | null: false               |
|first_name_kana                 | string              | null: false               |
|user_birth_date                 | date                | null: false               |

### Association
* has_many :items
* has_many :buy_items

## items table
| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
|item_name                            | string     | null: false                    |
|item_info                            | text       | null: false                    |
|item_category_id                     | integer    | null: false                    |
|item_sales-status_id                 | integer    | null: false                    |
|item_shipping_fee_status_id          | integer    | null: false                    |
|item_prefecture_id                   | integer    | null: false                    |
|item_scheduled_delivery_id           | integer    |null:false                      |
|item_price_id                        | integer    | null: false                   |
|user                                 | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :buy_item

## buy_items table
| Column                 | Type       | Options                       |
|------------------------|------------|-------------------------------|
|user                   | references | null: false, foreign_key: true |
|item                   | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :pay_form

### pay_forms
| Column      | Type       | Options                                     |
|-------------|------------|---------------------------------------------|
|postal_code  | string     | null: false                                 |
|prefecture   | string     | null: false                                 |
|city         | string     | null: false                                 |
|addresses    | string     | null: false, foreign_key: true              |
|building     | string     | null: false                                 |
|phone_number | string     | null: false                                 |

### Association
- belongs_to :buy_item