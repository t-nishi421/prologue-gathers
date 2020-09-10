class AddIconToBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :icon, null: false, foreign_key: true
  end
end
