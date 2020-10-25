class Car < ApplicationRecord
  has_many :infomations, foreign_key: "car_id", dependent: :destroy
  belongs_to :user, optional: true
  validates :car_name, presence: true
  mount_uploader :image, ImageUploader
end
