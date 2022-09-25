# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| encrypted_password | string | null: false               |
| email              | string | null: false, unique: true |
| first_name         | string | null: false               |
| family_name        | string | null: false               |
| first_name_kana    | string | null: false               |
| family_name_kana   | string | null: false               |
| birthday           | date   | null: false               |


### Association
- has_many :purchases
- has_many :items


## items テーブル
| Column              | Type        | Options                        |
| ------------------- | ----------- | ------------------------------ |
| name                | string      | null: false                    |
| introduction        | text        | null: false                    |
| category_id         | integer     | null: false                    |
| item_condition_id   | integer     | null: false                    |
| charges_id          | integer     | null: false                    |
| address_id          | integer     | null: false                    |
| preparation_day_id  | integer     | null: false                    |
| price               | integer     | null: false                    |
| user                | references  | null: false, foreign_key: true |

### Association
- belongs_to:user
- has_one:purchase



## destinations テーブル
| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| post_code     | string      | null: false                    |
| address_id    | integer     | null: false                    |
| municipality  | string      | null: false                    |
| house number  | string      | null: false                    |
| Building_name | string      |                                |
| phone_number  | string      | null: false                    |
| purchase      | references  | null: false, foreign_key: true |

### Association
- belongs_to :purchase


## purchases テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one:destination