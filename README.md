# テーブル設計

## usersテーブル

| column          | type    | options                   |
|-----------------|---------|---------------------------|
| nickname        | string  | null: false               |
| email           | string  | null: false, unique: true |
| last_name       | string  | null: false               |
| first_name      | string  | null: false               |
| last_name_kana  | string  | null: false               |
| first_name_kana | string  | null: false               |
| birthday        | date    | null: false               |


### Association
  has_many :items
  has_one :address
  has_many :comments


## itemsテーブル

| column           | type       | options                        |
|------------------|------------|--------------------------------|
| item_name        | string     | null: false                    |
| item_description | text       | null: false                    |
| category         | integer    | null: false                    |
| condition        | integer    | null: false                    |
| delivery_fee     | integer    | null: false                    |
| area_from        | integer    | null: false                    |
| term_to_send     | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
  belongs_to :user
  has_one :address
  has_many :comments


## addressesテーブル

| column         | type       | options                        |
|----------------|------------|--------------------------------|
| post_code      | string     | null: false                    |
| prefectures    | integer    | null: false                    |
| city           | string     | null: false                    |
| address_number | string     | null: false                    |
| building       | string     |                                |
| phone_number   | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

belongs_to :user
belongs_to :item


## commentsテーブル
| column  | type       | options                        |
|---------|------------|--------------------------------|
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

belongs_to :user
belongs_to :item