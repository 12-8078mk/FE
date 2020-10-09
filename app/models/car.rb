class Car < ApplicationRecord
  has_many :infomations
  belongs_to :user
  validates :car_name, presence: true
  mount_uploader :image, ImageUploader
end
