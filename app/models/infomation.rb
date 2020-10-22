class Infomation < ApplicationRecord
  belongs_to :user
  belongs_to :car
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :fueltype

  def total_refuel
    Infomation.all.sum(:refuel)
    # .include(car.id)
  end

  def odo
    - @car.infomations.each do |u|
      total_range += u.trip
    end
    odos = total_range + first_range
    return odos
  end
  
end
