class Book < ApplicationRecord
  validates :title, presence: true, length: { maximum: 48 }

  belongs_to :user
  has_many :texts
  belongs_to :color
  belongs_to :icon

  def self.search(search)
    if search != ""
      Book.where('title LIKE(?)', "%#{search}%")
    else
      Book.all
    end
  end

  def self.search_userid(user_id)
    Book.where(user: user_id.to_s)
  end

  def judge_create_book
    if title == ""
      false
    else
      true
    end
  end

  def self.number_of_books_for_user(user_id)
    Book.where(user: user_id.to_s).count
  end
end
