### users table

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
|item_sales_status_id                 | integer    | null: false                    |
|item_shipping_cost_id          | integer    | null: false                    |
|prefecture_id                        | integer    | null: false                    |
|item_shipping_date_id           | integer    | null:false                     |
|item_price                           | integer    | null: false                    |
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
|prefecture_id| integer    | null: false                                 |
|city         | string     | null: false                                 |
|building     | string     |                                             |
|address      | string     | null: false                                 |
|phone_number | string     | null: false                                 |
|buy_item     | references | null: false, foreign_key: true              |

### Association
- belongs_to :buy_item
>>>>>>> 7731cb90b18654ff2d17c5f2663792a13d117462
