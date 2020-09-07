class Book < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }

  belongs_to :user
  has_many :texts

  def self.search(search)
    if search != ""
      Book.where('title LIKE(?)', "%#{search}%")
    else
      Book.all
    end
  end
end
