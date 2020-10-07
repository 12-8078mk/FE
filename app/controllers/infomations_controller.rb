class InfomationsController < ApplicationController
  before_action :set_car

  def index
 
  end

  def new
    @infomation = Infomation.new
   
  end

  def create
    @infomation = @car.infomations.new(infomation_params)
    if @infomation.save
      redirect_to car_infomations_path(@car), notice: '入力が完了しました。'
    else
      # @infomations = @car.infomations.includes(:user)
      # flash.now[:alert] = 'メッセージを入力してください。'
      render :new
    end
  end

  private

  def infomation_params
    # FE = range / refuel
    params.require(:infomation).permit(:refuel, :cost, :refuelday, :TRIP, :fueltype).merge(user_id: current_user.id)
  end

  def set_car
    @car = Car.find(params[:car_id])
  end


  # def extra_info
  #   infomation_params.merge(@infomation.set_extra_infomation)
  # end
end