# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

- has_many :items


## items テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| product            | string     | null: false                   |
| category           | string     | null: false                   |
| product_condition  | string     | null: false                   |
| shipping_fee_payer | string     | null: false                   |
| shipping_region    | string     | null: false                   |
| estimated_delivery | string     | null: false                   |
| price              | integer    | null: false                   |
| user               | references | null: false,foreign_key: true |

- belong_to :user
- has_one :purchase

## purchases テーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| item    | references | null: false,foreign_key: true |
| user    | references | null: false,foreign_key: true |

- has_one :address
- belong_to :user
- belong_to :item