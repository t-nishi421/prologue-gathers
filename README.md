# 始まりの図書館　DB設計図
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
- has_many :books
- has_many :texts

## booksテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|image|string||
|rental|boolean|null: false|
|completion|boolean|null: false|
### Association
- belongs_to :user
- has_many :texts

## textsテーブル
|Column|Type|Options|
|------|----|-------|
|chapter|string|null: false|
|text|text|null: false|
### Association
- belongs_to :user
- belongs_to :book