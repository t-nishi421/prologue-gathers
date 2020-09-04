class CreateColors < ActiveRecord::Migration[6.0]
  def change
    create_table :colors do |t|
      t.string :color
      t.boolean :icon_white, null: false

      t.timestamps
    end
  end
end
