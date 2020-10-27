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
Icon.create(icon: "0_non.png")
Icon.create(icon: "1_heart.png")
Icon.create(icon: "2_school.png")
Icon.create(icon: "3_animal.png")
Icon.create(icon: "4_sword.png")
Icon.create(icon: "5_sound.png")
Icon.create(icon: "6_gourmet.png")
Icon.create(icon: "7_home.png")
Icon.create(icon: "8_machine.png")
Icon.create(icon: "9_horror.png")
Icon.create(icon: "10_octopus.png")
Icon.create(icon: "11_detective.png")
Icon.create(icon: "12_game.png")
Icon.create(icon: "13_robot.png")
Icon.create(icon: "14_ufo.png")
Icon.create(icon: "15_fairy.png")

## mysql
insert into icons (id, icon) values (1, '0_non.png');
insert into icons (id, icon) values (2, '1_heart.png');
insert into icons (id, icon) values (3, '2_school.png');
insert into icons (id, icon) values (4, '3_animal.png');
insert into icons (id, icon) values (5, '4_sword.png');
insert into icons (id, icon) values (6, '5_sound.png');
insert into icons (id, icon) values (7, '6_gourmet.png');
insert into icons (id, icon) values (8, '7_home.png');
insert into icons (id, icon) values (9, '8_machine.png');
insert into icons (id, icon) values (10, '9_horror.png');
insert into icons (id, icon) values (11, '10_octopus.png');
insert into icons (id, icon) values (12, '11_detective.png');
insert into icons (id, icon) values (13, '12_game.png');
insert into icons (id, icon) values (14, '13_robot.png');
insert into icons (id, icon) values (15, '14_ufo.png');
insert into icons (id, icon) values (16, '15_fairy.png');

update icons set icon = '0_non.png';
update icons set icon = '1_heart.png';
update icons set icon = '2_school.png';
update icons set icon = '3_animal.png';
update icons set icon = '4_sword.png';
update icons set icon = '5_sound.png';
update icons set icon = '6_gourmet.png';
update icons set icon = '7_home.png';
update icons set icon = '8_machine.png';
update icons set icon = '9_horror.png';
update icons set icon = '10_octopus.png';
update icons set icon = '11_detective.png';
update icons set icon = '12_game.png';
update icons set icon = '13_robot.png';
update icons set icon = '14_ufo.png';
update icons set icon = '15_fairy.png';