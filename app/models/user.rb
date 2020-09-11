class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true, length: { maximum: 8 }
  has_many :books
  has_many :texts

  def self.rental_status(book_id)
    status = User.find_by(rental: book_id)
    if status == nil
      "can_rent"
    else
      "can_not_rent"
    end
  end
end
