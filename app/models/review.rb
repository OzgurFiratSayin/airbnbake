class Review < ApplicationRecord
  belongs_to :user
  belongs_to :order
  validates :content, presence: true, length: { minimum: 10 }
  validates :rating, presence: true, inclusion: { in: 0..5 }
end
