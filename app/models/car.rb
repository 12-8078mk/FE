class Car < ApplicationRecord
  has_many :infomations
  belongs_to :user
  # validates :car_name, presence: true, uniqueness: true
end
