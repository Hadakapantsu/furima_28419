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
| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false | 
| email           | string | null: false |
| password        | string | null: false |
| familyname      | string | null: false |
| firstname       | string | null: false |
| rubi familyname | string | null: false |
| rubi firstname  | string | null: false |
| birthday        | date   | null: false |

### Association
- has_many :items, through:items_users


## items テーブル
| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| image          | string  | null: false                    |
| price          | string  | null: false                    |
| name           | string  | null: false                    |
| text           | string  | null: false                    |
| category       | integer | null: false                    |
| condition      | integer | null: false                    |
| cost burden    | integer | null: false, foreign_key: true |
| shipping place | integer | null: false, foreign_key: true |
| shipping days  | integer | null: false, foreign_key: true |

### Association
- belongs_to :user, through:items_users
- has_one :items_users



## comments テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
- belongs_to :items_users


## address テーブル
| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| post number    | string     | null: false |
| prefecture     | string     | null: false |
| city           | string     | null: false |
| house number   | string     | null: false |
| buillding name | string     |             |
| phone number   | string     | null: false |
### Association
- belongs_to :items_users


## items_users テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- has_many :comments
- belongs_to :user
- belongs_to :item 
- has_one :address


## items_comments テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | string     |                                |
| item    | references | null: false, foreign_key: true |

### Association
- belongs_to :comments
- belongs_to :item
