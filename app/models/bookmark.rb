class Bookmark < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :book_id, presence: true
  validates :user_id, presence: true

  def self.whetherBookmarked(user_id, book_id)
    Bookmark.where(user_id: user_id, book_id: book_id) == []
  end

  def self.bookmarkCount(book_id)
    count = Bookmark.where(book_id: book_id.to_s).count
  end
end
