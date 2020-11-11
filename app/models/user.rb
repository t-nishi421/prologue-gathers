class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true, length: { maximum: 8 }
  has_many :books
  has_many :texts
  has_many :steal_sentences
  has_many :steal_sentences, foreign_key: :stolen_user_id
  has_many :bookmarks

  mount_uploader :image, ImageUploader

  def self.rental_status(book_id)
    status = User.find_by(rental: book_id)
    if status == nil
      "can_rent"
    else
      "can_not_rent"
    end
  end

  def self.return_book_for_three_days
    lending_user = User.where.not(rental: 0)
    lending_user.each do |user|
      if user.updated_at <  1.minute.ago
      # if user.updated_at < 3.days.ago
        book = Book.find_by(id: user.rental)
        book.rental = 0
        book.record_timestamps = false
        book.save

        user.rental = -1
        user.save
      end
    end
  end
end
