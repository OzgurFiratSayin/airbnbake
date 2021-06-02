class Order < ApplicationRecord
  belongs_to :cake
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :order_date, presence: true
end
