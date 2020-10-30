class GraphsController < ApplicationController
  before_action :set_car

  def index
    @fe_data = []
    @avcost_data = []
    graphs = @car.infomations.includes(:user)
    graphs.order("refuelday").each do |inf|
      cost = inf.cost
      refuel = inf.refuel
      refuelday = inf.refuelday
      trip = inf.trip
      average_cost = cost / refuel
      average_fe = trip / refuel
      @fe_data << [ refuelday , average_fe]
      @avcost_data << [refuelday , average_cost]
    end
  end

  private
  def set_car
    @car = Car.find(params[:car_id])
  end
end