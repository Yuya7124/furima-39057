# テーブル設計
## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unique: true |
| email              | string | null: false, unique: true |
| password           | string | null: false, unique: true |
| encrypted_password | string | null: false, unique: true |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_reading | string | null: false               |
| last_name_reading  | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many   :products
- belongs_to :address

## products テーブル

| Column                   | Type           | Options                        |
| ------------------------ | -------------- | ------------------------------ |
| product_name             | string         | null: false                    |
| explanation              | text           | null: false                    |
| category                 | category_id    | null: false                    |
| conditions               | condition_id   | null: false                    |
| delivery                 | delivery_id    | null: false                    |
| delivery_prefectures     | prefectures_id | null: false                    |
| shipment_date            | genre_id       | null: false                    |
| cost                     | integer        | null: false                    |
| user                     | references     | null: false, foreign_key: true |


### Association

- belongs_to :user

## addresses テーブル

| Column          | Type           | Options                        |
| --------------- | -------------- | ------------------------------ |
| postal_code     | integer        | null: false                    |
| prefectures     | prefectures_id | null: false                    |
| city            | string         | null: false                    |
| house_number    | string         | null: false                    |
| building_number | string         |                                |
| tel_number      | integer        | null: false                    |
| user            | references     | null: false, foreign_key: true |

### Association

- belongs_to :user
