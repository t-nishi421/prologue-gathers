class StealSentence < ApplicationRecord
  belongs_to :text
  belongs_to :user
end
