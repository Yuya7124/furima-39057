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
| read_surname       | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :products, through :order
- has_one  :address, through :order


## products テーブル

| Column           | Type           | Options                        |
| ---------------- | -------------- | ------------------------------ |
| product_name     | string         | null: false                    |
| explanation      | text           | null: false                    |
| category_id      | integer        | null: false                    |
| condition_id     | integer        | null: false                    |
| delivery_tyoe_id | integer        | null: false                    |
| prefectures_id   | integer        | null: false                    |
| shipment_date_id | integer        | null: false                    |
| cost             | integer        | null: false                    |
| user             | references     | null: false, foreign_key: true |

### Association

- belongs_to :user, through :order
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :delivery_tyoe
- belongs_to_active_hash :prefectures
- belongs_to_active_hash :shipment_date

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :products
- belongs_to :address

## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | -----------| ------------------------------ |
| postal_code     | integer    | null: false                    |
| prefectures_id  | integer    | null: false                    |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| building_number | string     |                                |
| tel_number      | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user, through :order
- belongs_to_active_hash :prefectures
