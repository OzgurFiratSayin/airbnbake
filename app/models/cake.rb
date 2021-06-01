class Cake < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many :users, through: :order
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :size, presence: true
end
