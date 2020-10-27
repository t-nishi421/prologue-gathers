# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 使い方
# モデルクラス名.create(:カラム名1 => 値1, :カラム名2 => 値2, ...)

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