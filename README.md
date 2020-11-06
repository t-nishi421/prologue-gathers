# 始まりの図書館
## 目次
- 使い方
- DB設計図
# 使い方
※このアプリは手軽に小説をかけることを目的として作成しています。

始まりの図書館へようこそ。ここは小説投稿に飢えた無法者が集まる図書館。無法者？そう、ここはルールなんてものは存在しない！小説を投稿するためなら取れる手段全てが許される。<br>
さあ、君も小説を書こうじゃないか。


この図書館には大きく分けて以下の2つの機能があります。
1. 小説投稿機能
1. 閲覧機能
1. 辞書登録機能

## 1.小説投稿機能
ヘッダーメニュー又はマイページから小説を投稿することができます。<br>
本のアイコン、表紙の色、タイトル、章題、本文を入力した後に「投稿する」を押すと小説を投稿できます。

本を貸出しすることで、話の続きを投稿できます。本を貸出した後に、章題、本文を入力し「投稿する」ボタンを押すと話の続きを投稿できます。

## 2.閲覧機能
投稿された小説は一覧表示画面から閲覧することができます。<br>
本の閲覧をより快適にするため以下の機能があります。
- 検索機能
- ソート機能
- お気に入り登録機能
- 他のユーザーページから本人が投稿した本・お気に入り登録した本を閲覧する機能

## 3.辞書登録機能
ログインすると画面右上に昼（閲覧モード）・夜（クリエイターモード）に切り替えられるボタンが出現します。夜のモードではセンテンス泥棒機能（辞書登録機能）が利用できます。本の閲覧中に本文をドラッグし、緑色の保存ボタンを押すとセンテンスを保存できます。

# DB設計図
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
