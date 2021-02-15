# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :product_users
- has_many :products
- has_many :buy_users
- has_many :buys

## products テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| image            | ActiveStorageで実装   |
| title            | string  | null: false |
| description      | text    | null: false |
| category_id      | integer | null: false |
| Product_condition| string  | null: false |
| delivery_price   | string  | null: false |
| delivery_area    | string  | null: false |
| delivery_time    | string  | null: false |
| user             |reference| null: false |

### Association

- has_many :comments_product
- has_many :comments, through: comment_products
- has_many :buys_product
- has_many :buys, through: buy_products

## buys テーブル

| Column      | Type    | Options         |
| ----------- | ------- | --------------- |
| user        |reference| null: false     |
| product     |reference| null: false     |

### Association

- belongs_to :user
- belongs_to :product
- has_one :buyers

### buy_users テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| buy    | references | null: false, foreign_key: true |

### buy_product テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| product| references | null: false, foreign_key: true |
| buy    | references | null: false, foreign_key: true |


## buyers テーブル
| Column      | Type    | Options         |
| ----------- | ------- | --------------- |
| adress      |reference| null: false     |

### Association

- belongs_to :buy

