class CreateStealSentences < ActiveRecord::Migration[6.0]
  def change
    create_table :steal_sentences do |t|
      t.text :sentence,   null: false
      t.references :text, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
