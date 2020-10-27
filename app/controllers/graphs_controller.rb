class GraphsController < ApplicationController
  before_action :set_car

  def index
    # @data = [['2019-06-01', 100], ['2019-06-02', 200], ['2019-06-04', 150]]
    @cost_data = []
    @avcost_data = []
    graphs = @car.infomations.includes(:user)
    graphs.order("refuelday").each do |inf|
      cost = inf.cost
      refuel = inf.refuel
      refuelday = inf.refuelday
      average_cost = cost / refuel
      @cost_data << [ refuelday , cost]
      @avcost_data << [refuelday , average_cost]
    end
  end

  private
  def set_car
    @car = Car.find(params[:car_id])
  end
end