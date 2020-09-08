class Text < ApplicationRecord
  validates :chapter, presence: true, length: { maximum: 12 }
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
end
