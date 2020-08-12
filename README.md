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
| birthday        | string | null: false |

### Association
- has_one :credit
- has_many :items, through:items_users
- has_many :comments


## items テーブル
| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| image          | string | null: false |
| price          | string | null: false |
| itemname       | string | null: false |
| text           | string | null: false |
| category       | string | null: false |
| condition      | string | null: false |
| cost burden    | string | null: false |
| shipping place | string | null: false |
| shipping days  | string | null: false |

### Association
- belongs_to :users
- has_many :comments



## credit テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| creditcard number  | string | null: false, foreign_key: true |
| expiration date    | string | null: false, foreign_key: true |
| security code      | string | null: false, foreign_key: true |
| address            | string | null: false, foreign_key: true |
| phone number       | string | null: false, foreign_key: true |

### Association
- belongs_to :users


## comments テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items 



## items_users テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items 


## items_comments テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | string     |                                |
| item    | references | null: false, foreign_key: true |

### Association
- belongs_to :comments
- belongs_to :items 
