class Infomation < ApplicationRecord
  belongs_to :user
  belongs_to :car
  has_many :fueltypes

  # def range
  #   range = TRIP
  #   return range
  # end

  # def fe(range)
  #   refuel / range
  # end

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
  
  before_save do
    self.range = TRIP
    self.FE = refuel / TRIP
  end

end
