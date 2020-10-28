# 始まりの図書館 DB設計図
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|rental|boolean|null: false|
|image|string||
### Association
- has_many :books
- has_many :texts
- has_many :steal_sentences
- has_many :steal_sentences, foreign_key: :stolen_user_id
- has_many :bookmark

## booksテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false|
|color_id|reference|null: false|
|icon_id|reference|null: false|
|title|string|null: false|
|rental|boolean|default: 0|
|completion|boolean|null: false, default: 0|
### Association
- belongs_to :user
- has_many :texts
- belongs_to :icon
- belongs_to :color
- has_many :bookmark

## textsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false|
|book_id|reference|null: false|
|chapter|string|null: false|
|text|text|null: false|
### Association
- belongs_to :user
- belongs_to :book

## iconsテーブル
|Column|Type|Options|
|------|----|-------|
|icon|string||
### Association
- has_many :books

## colorsテーブル
|Column|Type|Options|
|------|----|-------|
|color|string||
|icon_white|boolean|null: false|
### Association
- has_many :books

## steal_sentencesテーブル
|Column|Type|Options|
|------|----|-------|
|sentence|string|null: false|
|text_id|reference|null: false|
|user_id|reference|null: false|
|stolen_user_id|reference|null: false|
### Association
- belongs_to :text
- belongs_to :user
- belongs_to :stolen_user, class_name: 'User', foreign_key: :stolen_user_id

## bookmarksテーブル
|Column|Type|Options|
|------|----|-------|
|book_id|reference|null: false|
|user_id|reference|null: false|
### Association
- belongs_to :book
- belongs_to :user
