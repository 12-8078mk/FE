class Infomation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :car, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :fueltype

  validates :refuel, :cost, :refuelday, :trip, :fueltype_id, presence: true
end
