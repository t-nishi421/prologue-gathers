class Text < ApplicationRecord
  validates :chapter, presence: true, length: { maximum: 20 }
  validates :text, presence: true

  belongs_to :user
  belongs_to :book
  
  def judge_create_text
    boolean = true
    if chapter == "" || text == ""
      boolean = false
    end
    boolean
  end

  def self.number_of_texts_for_current_user(user_id)
    Text.where(user: user_id.to_s).count
  end
end
