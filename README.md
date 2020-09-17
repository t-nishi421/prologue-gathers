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
## rails
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

## mysql
insert into colors (id, color, icon_white) values (1, '#e9e9e9', 0);
insert into colors (id, color, icon_white) values (2, '#eea9d1', 0);
insert into colors (id, color, icon_white) values (3, '#d67474', 0);
insert into colors (id, color, icon_white) values (4, '#f1b37f', 0);
insert into colors (id, color, icon_white) values (5, '#d8cc65', 0);
insert into colors (id, color, icon_white) values (6, '#b0d865', 0);
insert into colors (id, color, icon_white) values (7, '#3aa054', 0);
insert into colors (id, color, icon_white) values (8, '#79dfd6', 0);
insert into colors (id, color, icon_white) values (9, '#697dd6', 0);
insert into colors (id, color, icon_white) values (10, '#393b97', 1);
insert into colors (id, color, icon_white) values (11, '#472a8a', 1);
insert into colors (id, color, icon_white) values (12, '#752048', 1);
insert into colors (id, color, icon_white) values (13, '#b4914f', 0);
insert into colors (id, color, icon_white) values (14, '#946144', 0);
insert into colors (id, color, icon_white) values (15, '#b88add', 0);
insert into colors (id, color, icon_white) values (16, '#353535', 1);

# iconsテーブルのレコード
## rails
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

## mysql
insert into icons (id, icon) values (1, '0_non');
insert into icons (id, icon) values (2, '1_heart');
insert into icons (id, icon) values (3, '2_school');
insert into icons (id, icon) values (4, '3_animal');
insert into icons (id, icon) values (5, '4_sword');
insert into icons (id, icon) values (6, '5_sound');
insert into icons (id, icon) values (7, '6_gourmet');
insert into icons (id, icon) values (8, '7_home');
insert into icons (id, icon) values (9, '8_machine');
insert into icons (id, icon) values (10, '9_horror');
insert into icons (id, icon) values (11, '10_octopus');
insert into icons (id, icon) values (12, '11_detective');
insert into icons (id, icon) values (13, '12_game');
insert into icons (id, icon) values (14, '13_robot');
insert into icons (id, icon) values (15, '14_ufo');
insert into icons (id, icon) values (16, '15_fairy');
