# テーブル設計

## users テーブル

| Column             | Type    | Options     |
|--------------------|---------|-------------|
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birth_date         | string  | null: false |

### Association

- has_many :items
- has_many :purchase


## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| item_text       | text       | null: false                    |
| item_category   | string     | null: false                    |
| item_status     | string     | null: false                    |
| delivery fee    | string     | null: false                    |
| delivery source | string     | null: false                    |
| delivery_time   | string     | null: false                    |
| price           | string     | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery


## deliveries テーブル

| Column        | Type           | Options                        |
| ------------- | -------------- | ------------------------------ |
| postal_code   | string         | null: false                    |
| prefecture    | string         | null: false                    |
| city          | string         | null: false                    |
| house_number  | string         | null: false                    |
| building_name | string         | null: false                    |
| phone_number  | string         | null: false                    |
| purchase_id   | references     | null: false, foreign_key: true |

### Association

- belongs_to :purchase
