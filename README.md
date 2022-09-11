## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| password           | string              | null: false               |
| name               | string              | null: false               |

### Association
* has_many :items
* has_many :buy-items

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| item-name                           | string     | null: false                    |
| item-price                          | string     | null: false                    |
| item-category                       | string     | null: false                    |
| user                                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy-item

## buy-items table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| address     | text       | null: false                    |
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user