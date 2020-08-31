# 始まりの図書館 DB設計図
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|rental|boolean|null: false|
### Association
- has_many :books
- has_many :texts

## booksテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|author|int|null: false|
|color|string|null: false|
|icon|string||
|rental|int||
|completion|boolean|null: false|
### Association
- belongs_to :user
- has_many :texts

## textsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|int|null: false|
|book_id|int|null: false|
|text|text|null: false|
### Association
- belongs_to :user
- belongs_to :book