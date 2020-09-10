class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.boolean :rental, null: false, default: 0
      t.boolean :completion, null: false, default: 0

      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
