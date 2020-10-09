class Infomation < ApplicationRecord
  belongs_to :user
  belongs_to :car
  # belongs_to :fueltype

  def total_refuel
    - current_user.infomations.each do |i|
      total_refuel += i.refuel
    end
  end

  def odo
    -current_user.infomations.each do |u|
      total_range += u.TRIP
    end
    odos = total_range + first_range
  end
  
 

end
