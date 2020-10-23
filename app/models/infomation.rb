class Infomation < ApplicationRecord
  belongs_to :user
  belongs_to :car
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :fueltype

  validates :refuel, :cost, :refuelday, :trip, :fueltype_id, presence: true
end
