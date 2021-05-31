class Order < ApplicationRecord
  belongs_to :cake
  belongs_to :user
  validates :order_date, presence: true
end
