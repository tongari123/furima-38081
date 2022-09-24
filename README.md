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
| birthday_yyyy_id   | integer| null: false               |
| birthday_mm_id	   | integer| null: false               |
| birthday_dd_id     | integer| null: false               |





### Association
- has_many :purchase
- has_many :comments
- has_many :items


## items テーブル
| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| name             | string      | null: false                    |
| introduction     | text        | null: false                    |
| category         | integer     | null: false                    |
| item_condition   | integer     | null: false                    |
| charges          | integer     | null: false                    |
| address          | integer     | null: false                    |
| preparation_day  | integer     | null: false                    |
| price            | integer     | null: false                    |
| user             | references  | null: false, foreign_key: true |

### Association
- belongs_to:user
- has_many :comments
- has_one:purchase




## comments テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| text         | text       | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item



## destinations テーブル
| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| post_code     | string      | null: false                    |
| prefectures   | integer     | null: false                    |
| municipality  | string      | null: false                    |
| address       | string      | null: false                    |
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