# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル
| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false | 
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| familyname            | string | null: false |
| firstname             | string | null: false |
| rubi familyname       | string | null: false |
| rubi firstname        | string | null: false |
| birthday              | date   | null: false |

### Association
- has_many :items, through:items_users
- has_one :comment


## items テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| image          | string     | null: false                    |
| price          | integer    | null: false                    |
| name           | string     | null: false                    |
| text           | text       | null: false                    |
| category       | integer    | null: false                    |
| condition      | integer    | null: false                    |
| cost burden    | integer    | null: false                    |
| shipping place | integer    | null: false                    |
| shipping days  | integer    | null: false                    | 
| user           | references | null: false, foreign_key: true |

### Association
- belongs_to :user, through:items_users
- has_one :items_users
- has_one :comment



## comments テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## address テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post number    | string     | null: false                    |
| prefecture     | integer    | null: false                    |
| city           | string     | null: false                    |
| house number   | string     | null: false                    |
| buillding name | string     |                                |
| phone number   | string     | null: false                    |
| items_users    | references | null: false, foreign_key: true |

### Association
- belongs_to :items_users


## items_users テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item 
- has_one :address



