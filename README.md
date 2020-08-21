# テーブル設計

## usersテーブル

| Column                | Type    | Options     |
|---------------------- | ------- | ----------- |
| name                  | string  | null: false |
| name_reading          | string  | null: false |
| birth_year            | integer | null: false |
| birth_month           | inreger | null: false |
| birth_day             | integer | null: false |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmaiton | string  | null: false |

### Association

- has_many :items
- has_many :addresses

## itemsテーブル

| Column        | Type       | Options                        |
|-----------    | ---------- | ------------------------------ |
| image         | string     | null: false                    |
| item_name     | string     | null: false                    |
| discript      | text       | null: false                    |
| category      | integer    | null: false                    |
| status        | integer    | null: false                    |
| delivery_fee  | integer    | null: false                    |
| area          | integer    | null: false                    |
| delivery_time | integer    | null: false                    |
| price         | integer    | null: false                    |
| sold_out      | boolean    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :adress

## addresses

| Column        | Type       | Options                        |
|-----------    | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | integer    | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item