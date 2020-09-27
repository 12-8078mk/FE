class Car < ApplicationRecord
  has_many :car_users
  has_many :users, through: :car_users
  validates :car_name, presence: true, uniqueness: true
end
