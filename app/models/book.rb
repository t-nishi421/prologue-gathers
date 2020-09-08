class Book < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }

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

  def judge_create_book
    boolean = true
    if title == ""
      boolean = false
    end
    boolean
  end
end
