# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| full_name| string | null: false |
| birthday | date   | null: false |

### Association
- has_many :product_users
- has_many :products, through: product_users
- has_many :buy_users
- has_many :buys, through: buy_users
- has_many :comment_users
- has_many :comments, through: comment_users

## comments テーブル

| Column   | Type     | Options     |
| -------- | -------- | ----------- |
| text     | text     | null: false |
| user     |references| null: false |
| product  |references| null: false |

### Association

- belongs_to :user
- belongs_to :product

## products テーブル

| Column   | Type   | Options         |
| -------- | ------ | --------------- |
| image       | ActiveStorageで実装   |
| title       | string  | null: false |
| description | text    | null: false |
| category    | text    | null: false |
| detail      | string  | null: false |
| user        |reference| null: false |

### Association

- has_many :comments_product
- has_many :comments, through: comment_products
- has_many :buys_product
- has_many :buys, through: buy_products

## buys テーブル

| Column   | Type   | Options         |
| -------- | ------ | --------------- |
| adress      | string  | null: false |
| information | string  | null: false |
| user        |reference| null: false |
| product     |reference| null: false |

### Association

- belongs_to :user
- belongs_to :product

