# テーブル設計

## usersテーブル

| column             | type   | options                   |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association
  has_many :items
  has_many :sales_records


## itemsテーブル

| column           | type       | options                        |
|------------------|------------|--------------------------------|
| item_name        | string     | null: false                    |
| item_description | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| delivery_fee_id  | integer    | null: false                    |
| area_from-id     | integer    | null: false                    |
| term_to_send_id  | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
  belongs_to :user
  has_one :sales_records


## sales_recordsテーブル

| column    | type       | options                        |
|-----------|------------|--------------------------------|
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |
| address   | references | null: false, foreign_key: true |

### Association
  belongs_to :user
  belongs_to :item
  has_one :address


## addressesテーブル

| column         | type       | options                        |
|----------------|------------|--------------------------------|
| post_code      | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| city           | string     | null: false                    |
| address_number | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |

### Association
  belongs_to :sales_record

