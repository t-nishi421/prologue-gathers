class Book < ApplicationRecord
  belongs_to :user
  has_many :texts
end
