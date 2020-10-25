class GraphsController < ApplicationController
  before_action :set_car

  def index
    # @data = [['2019-06-01', 100], ['2019-06-02', 200], ['2019-06-03', 150]]
    @data = []
    @graphs = @car.infomations.includes(:user)
    @graphs.order("refuelday").each do |inf|
      refuel = inf.refuel
      refuelday = inf.refuelday
      @date << {refuelday ,refuel}
    end
  end


  private
  def set_car
    @car = Car.find(params[:car_id])
  end

end
