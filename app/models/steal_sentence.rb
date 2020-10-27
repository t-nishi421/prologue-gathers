class StealSentence < ApplicationRecord
  belongs_to :text
  belongs_to :user
  belongs_to :stolen_user, class_name: 'User', foreign_key: :stolen_user_id

  validates :sentence, presence: true
  validates :text_id, presence: true
  validates :user_id, presence: true
  validates :stolen_user_id, presence: true

  def self.number_of_sentences_steal(user_id)
    count = StealSentence.where(user: user_id.to_s)
    not_count = count.where(stolen_user: user_id.to_s).count
    answer = count.count - not_count
  end

  def self.number_of_sentences_stolen(user_id)
    count = StealSentence.where(stolen_user: user_id.to_s)
    not_count = count.where(user: user_id.to_s).count
    answer = count.count - not_count
  end
end
