class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reviews, dependent: :destroy
  has_many :cakes, dependent: :destroy # !
  has_many :orders
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true, length: { minimum: 6 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validate :password_regex
  include PgSearch::Model
  multisearchable against: [:first_name, :last_name]

  private

  def password_regex
    return if password.blank? || password =~ /\A(?=.*\d)(?=.*[A-Z])(?=.*\W)[^ ]{7,}\z/

    errors.add :password, 'Password should have more than 7 characters including 1 uppercase letter, 1 number, 1 special character'
  end
end
