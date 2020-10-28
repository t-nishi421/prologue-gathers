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
end
