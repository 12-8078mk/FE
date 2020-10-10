class Infomation < ApplicationRecord
  belongs_to :user
  belongs_to :car
  # belongs_to :fueltype

  def total_refuel
    - @car.infomations.each do |i|
      total_refuel += i.refuel
    end
  end

  def odo
    - @car.infomations.each do |u|
      total_range += u.trip
    end
    odos = total_range + first_range
  end
  
 

end
