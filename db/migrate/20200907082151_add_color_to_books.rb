class AddColorToBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :color, null: false, foreign_key: true
  end
end
