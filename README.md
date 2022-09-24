
## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| password           | string | null: false |
| email              | string | null: false |
| first_name         | string | null: false |
| family_name        | string | null: false |
| first_name_kana    | string | null: false |
| family_name_kana   | string | null: false |


### Association
- has_one :credit
- has_many :purchase
- has_many :comments
- has_many :items


## items テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| introduction     | string     | null: false                    |
| category         | string     | null: false                    |
| item_condition   | string     | null: false                    |
| charges          | string     | null: false                    |
| address          | string     | null: false                    |
| preparation_day  | string     | null: false                    |
| price            | string     | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association
- belongs_to:user
- has_many :comments
- has_one:purchase




## comments テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| text         | text       | null: false                    |
| user_id      | references | null: false, foreign_key: true |
| item_id      | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item



## credit テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| card_number   | string     | null: false                    |
| expire_date   | string     | null: false                    |
| security_code | string     | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association
- belongs_to :user


## destination テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefectures   | string     | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | string     | null: false                    |
| purchase_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase


## purchase テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one:destination