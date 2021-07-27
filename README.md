# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
|--------------------|---------|---------------------------|
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birth_date         | string  | null: false               |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| text            | text       | null: false                    |
| item_category   | integer    | null: false                    |
| item_status     | integer    | null: false                    |
| delivery_fee    | integer    | null: false                    |
| delivery_source | integer    | null: false                    |
| delivery_time   | integer    | null: false                    |
| price           | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery


## deliveries テーブル

| Column          | Type           | Options                        |
| --------------- | -------------- | ------------------------------ |
| postal_code     | string         | null: false                    |
| delivery_source | integer        | null: false                    |
| city            | string         | null: false                    |
| house_number    | string         | null: false                    |
| building_name   | string         |                                |
| phone_number    | string         | null: false                    |
| purchase        | references     | null: false, foreign_key: true |

### Association

- belongs_to :purchase
