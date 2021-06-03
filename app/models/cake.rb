class Cake < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many :reviews, through: :orders
  # has_many :users, through: :order
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :size, presence: true
  has_many_attached :photos
  include PgSearch::Model
  multisearchable against: [:name, :description]
  pg_search_scope :search_by_name_description_user,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
