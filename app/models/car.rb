class Car < ApplicationRecord
  has_many :car_users
  belongs_to :user
  # validates :car_name, presence: true, uniqueness: true
end
