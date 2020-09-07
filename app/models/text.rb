class Text < ApplicationRecord
  validates :chapter, presence: true, length: { maximum: 12 }
  validates :text, presence: true

  belongs_to :user
  belongs_to :book
end
