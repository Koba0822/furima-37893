## users table

| Column                          | Type                | Options                   |
|---------------------------------|---------------------|---------------------------|
| nickname                        | string              | null: false               |
| email                           | string              | null: false, unique: true |
| encrypted_password              | string              | null: false               |
| encrypted_password-confirmation | string              | null: false               |
| last_name                       | string              | null: false               |
| first_name                      | string              | null: false               |
| last_name_kana                  | string              | null: false               |
| first_name_kana                 | string              | null: false               |
| user_birth_date                 | datetime            | null: false               |

### Association
* has_many :items
* has_many :buy_items
* has_one  :pay_forms

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
|item_image                           | string     | null: false                    |
|item_name                            | string     | null: false                    |
|item_info                            | string     | null: false                    |
|item_category                        | string     | null: false                    |
|item_sales-status                    | string     | null: false                    |
|item_shipping_fee_status             | string     | null: false                    |
|item_prefecture                      | string     | null: false                    |
|item_scheduled_delivery              | string     | null: false                    | 
|item_price                           | integer    | null: false                    |
|profit                               | string     | null: false                    |


### Association

- belongs_to :user
- has_one :buy_item
- has_one :pay_form

## buy_items table

| Column                 | Type       | Options                        |
|------------------------|------------|--------------------------------|
| buy_item_img           | string     | null: false                    |
| buy_item_right_content | string     | null: false                    |
| buy_item_text          | text       | null: false                    |
| buy_item_price_id      | integer    | null: false                    |
### Association

- belongs_to :item
- belongs_to :user
- belongs_to :pay_form


### pay_form
| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
|postal_code  | string     | null: false                    |
|prefecture   | string     | null: false                    |
|city         | string     | null: false                    |
|addresses    | string     | null: false                    |
|building     | string     | null: false                    |
|phone_number | string     | null: false                    |

- belongs_to :user
- has_one :buy_item
- belongs_to :item