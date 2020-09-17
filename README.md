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
|user_id|int|null: false|
|color_id|string|null: false|
|icon_id|string|null: false|
|title|string|null: false|
|rental|boolean|default: 0|
|completion|boolean|null: false, default: 0|
### Association
- belongs_to :user
- has_many :texts
- belongs_to :icon
- belongs_to :color

## textsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|int|null: false|
|book_id|int|null: false|
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

# colorsテーブルのレコード
Color.create(color: "#e9e9e9", icon_white: 0)
Color.create(color: "#eea9d1", icon_white: 0)
Color.create(color: "#d67474", icon_white: 0)
Color.create(color: "#f1b37f", icon_white: 0)
Color.create(color: "#d8cc65", icon_white: 0)
Color.create(color: "#b0d865", icon_white: 0)
Color.create(color: "#3aa054", icon_white: 0)
Color.create(color: "#79dfd6", icon_white: 0)
Color.create(color: "#697dd6", icon_white: 0)
Color.create(color: "#393b97", icon_white: 1)
Color.create(color: "#472a8a", icon_white: 1)
Color.create(color: "#752048", icon_white: 1)
Color.create(color: "#b4914f", icon_white: 0)
Color.create(color: "#946144", icon_white: 0)
Color.create(color: "#b88add", icon_white: 0)
Color.create(color: "#353535", icon_white: 1)

# iconsテーブルのレコード
Icon.create(icon: "0_non")
Icon.create(icon: "1_heart")
Icon.create(icon: "2_school")
Icon.create(icon: "3_animal")
Icon.create(icon: "4_sword")
Icon.create(icon: "5_sound")
Icon.create(icon: "6_gourmet")
Icon.create(icon: "7_home")
Icon.create(icon: "8_machine")
Icon.create(icon: "9_horror")
Icon.create(icon: "10_octopus")
Icon.create(icon: "11_detective")
Icon.create(icon: "12_game")
Icon.create(icon: "13_robot")
Icon.create(icon: "14_ufo")
Icon.create(icon: "15_fairy")
