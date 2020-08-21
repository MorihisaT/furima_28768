# テーブル設計

## usersテーブル

| Column                | Type    | Options     |
|---------------------- | ------- | ----------- |
| first_name            | string  | null: false |
| last_name             | string  | null: false |
| first_name_reading    | string  | null: false |
| last_name_reading     | string  | null: false |
| birthday              | date    | null: false |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmaiton | string  | null: false |

### Association

- has_many :items
- has_many :addresses
- has_many :orders

## itemsテーブル

| Column        | Type       | Options                        |
|-----------    | ---------- | ------------------------------ |
| image         | string     | null: false                    |
| name          | string     | null: false                    |
| discript      | text       | null: false                    |
| category      | integer    | null: false                    |
| status        | integer    | null: false                    |
| delivery_fee  | integer    | null: false                    |
| area          | integer    | null: false                    |
| delivery_time | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :address
- has_one :order

## addresses

| Column        | Type       | Options                        |
|-----------    | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order

## orders

| Column | Type       | Options                        |
|------- | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address