class Infomation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :car, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :fueltype

  validates :refuel, :cost, :refuelday, :trip, :fueltype_id, presence: true

  before_save :set_fuel_economy
  def set_fuel_economy
    fuel_economy = fuel_economy = trip / refuel if refuel > 0
  end
end
