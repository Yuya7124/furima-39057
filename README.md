# テーブル設計
## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| surname            | string | null: false               |
| given_name         | string | null: false               |
| read_surname       | string | null: false               |
| read_given_name    | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :orders
- has_many :items


## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| product_name     | string     | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| delivery_type_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipment_date_id | integer    | null: false                    |
| cost             | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to             :user
- has_one                :order
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :delivery_tyoe
- belongs_to_active_hash :prefectures
- belongs_to_active_hash :shipment_date

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| building_number | string     |                                |
| tel_number      | string     | null: false                    |
| order           | references | null: false, foreign_key: true |

### Association

- belongs_to             :order
- belongs_to_active_hash :prefectures
