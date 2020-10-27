class AddStolenUserIdToStealSentence < ActiveRecord::Migration[6.0]
  def change
    add_reference :steal_sentences, :stolen_user, foreign_key: { to_table: :users }
  end
end
