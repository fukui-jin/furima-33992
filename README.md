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
- has_many :products
- has_many :buys

## products テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| title               | string  | null: false |
| description         | text    | null: false |
| category_id         | integer | null: false |
| product_condition_id| integer | null: false |
| delivery_price_id   | integer | null: false |
| prefectures_id      | integer | null: false |
| delivery_time_id    | integer | null: false |
| price               | integer | null: false |
| user                |reference| null: false |

### Association

- has_many :buys

## buys テーブル

| Column      | Type    | Options                         |
| ----------- | ------- | ------------------------------- |
| user        |reference| null: false, foreign_key: true  |
| product     |reference| null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :product
- has_one :buyer

## buyers テーブル
| Column         | Type    | Options                         |
| -------------- | ------- | ------------------------------- |
| postal_code    | string  | null: false                     |
| prefectures_id | integer | null: false                     |
| city           | string  | null: false                     |
| address        | string  | null: false                     |
| building_name  | string  |                                 |
| phone_number   | string  | null: false                     |
| buy            |reference| null: false, foreign_key: true  |

### Association

- belongs_to :buy

